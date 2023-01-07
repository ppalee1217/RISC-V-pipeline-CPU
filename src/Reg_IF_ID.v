module Reg_IF_ID (
    input clk,
    input rst,
    input stall,
    input stall_cache,
    input jb,
    input [31:0] current_pc_in, inst_in,
    output reg[31:0] inst_out, current_pc_out
    );
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            inst_out <= 32'd19;
            current_pc_out <= 32'd0;
        end
        // jump or branch condition is established => jb == 1 => flush the previous instruction
        else if (jb) begin
            // nop is addi x0, x0, 0 => instruction opcode is 0010011, which is 32d'19
            inst_out <= 32'd19;
            current_pc_out <= 32'd0;
        end
        // stall the cpu => do not update out data
        else if (stall) begin
            inst_out <= inst_out;
            current_pc_out <= current_pc_out;
        end
        else if (stall_cache) begin
            inst_out <= inst_out;
            current_pc_out <= current_pc_out;
        end
        // jump or branch condition doesn't establish => jb == 0 => keep updating out data
        else begin
            inst_out <= inst_in;
            current_pc_out <= current_pc_in;
        end

    end

endmodule