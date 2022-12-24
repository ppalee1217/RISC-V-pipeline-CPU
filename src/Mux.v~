module Mux (
    input [31:0] a, b,
    input s,
    output [31:0] c
 );
 // c = a (s == 1)
 // c = b (s == 0)
 assign c = (s == 1'b0) ? b : a;

endmodule

// | \
// |  \
// | a |
// |   | --> c
// | b |
// |  / <----s
// | /
