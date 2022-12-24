module RegFile(
    input clk,
    input wb_en,
    input [31:0] wb_data,
    input [4:0] rd_index,
    input [4:0] rs1_index,
    input [4:0] rs2_index, 
    output [31:0] rs1_data_out,
    output [31:0] rs2_data_out
    );
    reg [31:0] registers [0:31];

    // Combinational
    assign rs1_data_out = registers[rs1_index];
    assign rs2_data_out = registers[rs2_index];

    // Sequential
    always @(posedge clk) begin
        if (rd_index != 5'd0) begin
            if (wb_en) begin
                $display("(Stage 5)rs[%d] <- 0x%h", rd_index, wb_data);
                registers[rd_index] <= wb_data;
            end
        end
        // x0 is grounded
        else begin
            registers[rd_index] <= 32'd0;
        end
    end
endmodule