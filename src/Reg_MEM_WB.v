module Reg_MEM_WB (
    input clk,
    input rst,
    input [31:0] alu_out_in, ld_data_in, current_pc_in,
    output reg[31:0] alu_out_out, ld_data_out, current_pc_out
    );
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            alu_out_out <= 32'd0;
            ld_data_out <= 32'd0;
            current_pc_out <= 32'd0;
        end
        else begin
            alu_out_out <= alu_out_in;
            ld_data_out <= ld_data_in;
            current_pc_out <= current_pc_in;
        end
    end
endmodule