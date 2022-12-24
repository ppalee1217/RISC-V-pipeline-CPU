module Imme_Ext(
    input [31:0] inst,
    output reg [31:0] imm_ext_out
    );
    wire [4:0] opcode;
    assign opcode = inst[6:2];
    parameter // opcode
              R_type  = 5'b01100,
              I_Comp  = 5'b00100,
              I_Load  = 5'b00000,
              Store = 5'b01000,
              B_type  = 5'b11000,
              J_jal   = 5'b11011,
              I_jalr  = 5'b11001,
              U_lui   = 5'b01101,
              U_auipc = 5'b00101;
    
    always @(*) begin
        // R type
        if (opcode == R_type) begin
            imm_ext_out = 32'd0;
        end
        // I type
        else if ((opcode == I_Comp) || (opcode == I_Load) || (opcode == I_jalr)) begin
            imm_ext_out = {{20{inst[31]}},inst[31:20]};
        end
        // S type
        else if (opcode == Store) begin
            imm_ext_out = {{20{inst[31]}},inst[31:25],inst[11:7]};
        end
        // B type
        else if (opcode == B_type) begin
            imm_ext_out = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};
        end
        // U type
        else if ((opcode == U_lui) || (opcode == U_auipc)) begin
            imm_ext_out = {inst[31:12],12'b0};
        end
        // J type
        else begin
            imm_ext_out = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};
        end
    end
endmodule