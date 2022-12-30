`include "./src/Booth_multiplier.v"
`include "./src/Dadda.v"
`include "./src/Han_Carlson.v"

module Mul(A, B, product);
parameter BITWIDTH = 16;

input  [15:0] A;
input  [15:0] B;
output [31:0] product;

wire [BITWIDTH:0]  row0;
wire [BITWIDTH:0]  row1;
wire [BITWIDTH:0]  row2;
wire [BITWIDTH:0]  row3;
wire [BITWIDTH:0]  row4;
wire [BITWIDTH:0]  row5;
wire [BITWIDTH:0]  row6;
wire [BITWIDTH:0]  row7;
wire [7:0]         add;
wire [32:0]        OS;
wire [32:1]        OC;

Booth_multiplier BM(
.X(A),
.Y(B),
.row0(row0),
.row1(row1),
.row2(row2),
.row3(row3),
.row4(row4),
.row5(row5),
.row6(row6),
.row7(row7),
.add(add)
);

Dadda DADDA(
.row0(row0),
.row1(row1),
.row2(row2),
.row3(row3),
.row4(row4),
.row5(row5),
.row6(row6),
.row7(row7),
.add(add),
.in_sumRow(33'd0),
.in_carryRow(32'd0),
.out_sumRow(OS),
.out_carryRow(OC)
);

Han_Carlson HCA(
.A(OS[31:0]),
.B({OC[31:1],1'b0}),
.sum(product),
.cout()
);
endmodule
