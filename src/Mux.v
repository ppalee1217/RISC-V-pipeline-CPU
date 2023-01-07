module Mux (
    input [31:0] a, b,
    input s,
    output reg [31:0] c
 );
 // c = a (s == 1)
 // c = b (s == 0)
 always@(*) begin
    c = (s == 1'b0) ? b : a;
 end

endmodule

// | \
// |  \
// | a |
// |   | --> c
// | b |
// |  / <----s
// | /
