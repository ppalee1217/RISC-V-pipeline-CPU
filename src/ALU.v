`include "./src/Mul.v"

module ALU(
    input [4:0] opcode,
    input [2:0] func3,
    input [6:0] func7,
    input [31:0] operand1,
    input [31:0] operand2,
    output reg [31:0] alu_out
    );

    wire [31:0] mul_result;
    Mul multiplier(
        .A(operand1[15:0]),
        .B(operand2[15:0]),
        .product(mul_result)
    );

    parameter 
            // opcode
              R_type  = 5'b01100,
              I_Comp  = 5'b00100,
              I_Load  = 5'b00000,
              Store = 5'b01000,
              B_type  = 5'b11000,
              J_jal   = 5'b11011,
              I_jalr  = 5'b11001,
              U_lui   = 5'b01101,
              U_auipc = 5'b00101,
            // func3 for I & R
              Add_Sub = 3'b000,
              Slt     = 3'b010,
              Sltu    = 3'b011,
              Xor     = 3'b100,
              Or      = 3'b110,
              And     = 3'b111,
              Sll     = 3'b001,
              Srl_Sra = 3'b101,
            // func3 for B_type
              beq     = 3'b000,
              bne     = 3'b001,
              blt     = 3'b100,
              bge     = 3'b101,
              bltu    = 3'b110,
              bgeu    = 3'b111,
            // func3 for M_extension (Still in R_type)
              mul     = 3'b000, // Due to multiplier limitation, we only implement mul(output is 32 bits)
              div     = 3'b100,
              divu    = 3'b101,
              rem     = 3'b110,
              remu    = 3'b111,
            // func7 for M_extension
              R_and_I_type = 7'b0100000,
              M_type = 7'b0000001;

    always @(*) begin
        case(opcode)
            I_Comp , R_type: begin
                if((func7 == M_type) && (opcode == R_type)) begin
                    case(func3)
                        mul: begin
                            alu_out = mul_result;
                        end
                        div: begin
                            alu_out = ($signed(operand1) / $signed(operand2));
                        end
                        divu: begin
                            alu_out = (operand1 / operand2);
                        end
                        rem: begin
                            alu_out = ($signed(operand1) % $signed(operand2));
                        end
                        remu: begin
                            alu_out = (operand1 % operand2);
                        end
                    endcase
                end
                else begin
                    case(func3)
                        Add_Sub: begin
                            // Sub
                            if ((opcode == R_type) && (func7 == R_and_I_type)) begin
                                alu_out = operand1 - operand2;
                            end
                            // Add
                            else begin
                                alu_out = operand1 + operand2;
                            end
                        end
                        Slt: begin
                            alu_out = ($signed(operand1) < $signed(operand2))? 32'd1 : 32'd0;
                        end
                        Sltu: begin
                            alu_out = (operand1 < operand2)? 32'd1 : 32'd0;
                        end
                        Xor: begin
                            alu_out = operand1 ^ operand2;
                        end
                        Or: begin
                            alu_out = operand1 | operand2;
                        end
                        And: begin
                            alu_out = operand1 & operand2;
                        end
                        Sll: begin
                            alu_out = operand1 << operand2[4:0];
                        end
                        Srl_Sra: begin
                            // Sra
                            if ((func7) == R_and_I_type) begin
                                alu_out = $signed(operand1) >>> operand2[4:0];
                            end
                            // Srl
                            else begin
                                alu_out = operand1 >> operand2[4:0];
                            end
                        end
                    endcase
                end
            end
            B_type: begin
                case(func3)
                    beq: begin
                        if (operand1 == operand2) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                    bne: begin
                        if (operand1 != operand2) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                    bltu: begin
                        if (operand1 < operand2) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                    blt: begin
                        if ($signed(operand1) < $signed(operand2)) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                    bgeu: begin
                        if (operand1 >= operand2) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                    bge: begin
                        if ($signed(operand1) >= $signed(operand2)) begin
                            alu_out = 32'd1;
                        end
                        else begin
                            alu_out = 32'd0;
                        end
                    end
                endcase
            end
            // output operand1 + operand2
            I_Load , Store , U_auipc: begin
                alu_out = operand1 + operand2;
            end
            // output = imme
            U_lui: begin
                alu_out = operand2;
            end
            // output = pc + 4
            I_jalr , J_jal: begin
                alu_out = operand1 + 4;
            end 

            default: begin
                alu_out = 32'd0;
            end

        endcase
    end
endmodule
