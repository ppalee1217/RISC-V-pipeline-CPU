module Mux_Three (
    input [31:0] a, b, c,
    input [1:0] s,
    output [31:0] d
    );
    assign d = (s == 2'd0) ? a :
               (s == 2'd1) ? b :
               c;
endmodule

//      | \
//      |  \
// a -->| 0 |
// b -->| 1 |
// c -->| 2 | --> d
//      |   |
//      |  / <----s
//      | /