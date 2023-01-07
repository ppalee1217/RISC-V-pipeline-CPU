module DM(
    input clk,
    input [3:0] w_en,
    input [15:0] address,
    inout [31:0] data
    );
    reg [7:0] mem [0:65535];

    // Load(DM) or Read instructions(IM)-> Combinational
    // Read
    assign data = (w_en == 4'b0) ? {mem[address+3], mem[address+2], mem[address+1], mem[address]} : 32'hz;
    
    // Store(DM) -> Sequential
    // Write
    always @(posedge clk) begin
        if (w_en[0]) begin
            mem[address] <= data[7:0];
        end
        if (w_en[1]) begin
            mem[address + 16'd1] <= data[15:8];
        end
        if (w_en[2]) begin
            mem[address + 16'd2] <= data[23:16];
        end
        if (w_en[3]) begin
            mem[address + 16'd3] <= data[31:24];
        end
    end


endmodule
