module DM(
    input clk,
    input [3:0] w_en,
    input [15:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
    );
    reg [7:0] mem [0:65535];
    // Load(DM) or Read instructions(IM)-> Combinational
    always @(*) begin
        if (w_en == 4'b0) begin
            read_data = {mem[address+3], mem[address+2], mem[address+1], mem[address]};
        end
    end
    
    // Store(DM) -> Sequential
    always @(posedge clk) begin
        if (w_en[0]) begin
            mem[address] <= write_data[7:0];
        end
        if (w_en[1]) begin
            mem[address + 16'd1] <= write_data[15:8];
        end
        if (w_en[2]) begin
            mem[address + 16'd2] <= write_data[23:16];
        end
        if (w_en[3]) begin
            mem[address + 16'd3] <= write_data[31:24];
        end
    end


endmodule