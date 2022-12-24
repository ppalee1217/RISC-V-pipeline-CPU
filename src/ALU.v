module ALU(
    input [4:0] opcode,
    input [2:0] func3,
    input       func7,
    input [31:0] operand1,
    input [31:0] operand2,
    output reg [31:0] alu_out
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
              bgeu    = 3'b111;
            

    always @(*) begin
        case(opcode)
            I_Comp , R_type: begin
                case(func3)
                    Add_Sub: begin
                        // Sub
                        if ((opcode == R_type) && func7) begin
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
                        if (func7) begin
                            alu_out = $signed(operand1) >>> operand2[4:0];
                        end
                        // Srl
                        else begin
                            alu_out = operand1 >> operand2[4:0];
                        end
                    end
                endcase
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
                if(!U_auipc) begin
                    $display("(Stage 3)Operand1: 0x%h, Operand2: 0x%h", operand1, operand2);
                    $display("(Stage 3)Load/Store position: 0x%h", (operand1 + operand2));
                end
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
