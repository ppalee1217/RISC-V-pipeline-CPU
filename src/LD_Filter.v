module LD_Filter(
    input [2:0] func3,
    input [31:0] ld_data,
    output reg [31:0] ld_data_f
    );
    reg [31:0] mask;
    parameter 
            // func3 for I_Load
              lb      = 3'b000,
              lh      = 3'b001,
              lw      = 3'b010,
              lbu     = 3'b100,
              lhu     = 3'b101;

    always @(*) begin
        case(func3)
            lb: begin
                ld_data_f = {{24{ld_data[7]}},ld_data[7:0]};
            end
            lh: begin
                ld_data_f = {{16{ld_data[15]}},ld_data[15:0]};
            end
            lw: begin
                ld_data_f = ld_data;
            end
            lbu: begin
                ld_data_f = {{24'd0},ld_data[7:0]};
            end
            lhu: begin
                ld_data_f = {{16'd0},ld_data[15:0]};
            end
        endcase
    end
    
endmodule