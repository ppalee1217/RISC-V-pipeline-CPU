module Reg_EX_MEM (
    input clk,
    input rst,
    input stall_cache,
    input stall,
    input [31:0] alu_out_in, rs2_data_in, current_pc_in,
    output reg[31:0] alu_out_out, rs2_data_out, current_pc_out
    );
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            alu_out_out <= 32'd0;
            rs2_data_out <= 32'd0;
            current_pc_out <= 32'd0;
        end
        // stall has bigger priority
        else if(stall) begin
            alu_out_out <= alu_out_in;
            rs2_data_out <= rs2_data_in;
            current_pc_out <= current_pc_in;
        end
        // cache provoked stall
        else if (stall_cache) begin
            alu_out_out <= alu_out_out;
            rs2_data_out <= rs2_data_out;
            current_pc_out <= current_pc_out;
        end
        else begin
            alu_out_out <= alu_out_in;
            rs2_data_out <= rs2_data_in;
            current_pc_out <= current_pc_in;
        end
    end
endmodule