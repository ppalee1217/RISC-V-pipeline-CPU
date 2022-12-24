module Reg_ID_EX (
    input clk,
    input rst,
    input stall, jb,
    input [31:0] current_pc_in, rs1_data_in, rs2_data_in, sext_imm_in,
    output reg[31:0] current_pc_out, rs1_data_out, rs2_data_out, sext_imm_out
    );
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            current_pc_out <= 32'd0;
            rs1_data_out <= 32'd0;
            rs2_data_out <= 32'd0;
            sext_imm_out <= 32'd0;
        end
        // jump or branch condition is established => jb == 1 => flush the previous instruction
        // stall is detected => insert nop
        else if (jb || stall) begin
            current_pc_out <= 32'd0;
            rs1_data_out <= 32'd0;
            rs2_data_out <= 32'd0;
            sext_imm_out <= 32'd0;
        end
        else begin
            $display("(Stage 2)rs1_data = 0x%h, rs2_data = 0x%h, sext_imm = 0x%h", rs1_data_in, rs2_data_in, sext_imm_in);
            current_pc_out <= current_pc_in;
            rs1_data_out <= rs1_data_in;
            rs2_data_out <= rs2_data_in;
            sext_imm_out <= sext_imm_in;
        end

    end
endmodule