/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Dec 26 11:19:59 2022
/////////////////////////////////////////////////////////////


module Booth_encoder_0 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module row_LSB_0 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n1;

  NOR2BX1 U1 ( .AN(x), .B(n1), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n1) );
endmodule


module complement_0 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n1, n2;

  NOR2BX1 U1 ( .AN(y[2]), .B(n1), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n2), .Y(n1) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n2) );
endmodule


module Booth_decoder_0 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n1, n2;

  OAI32X1 U1 ( .A0(n1), .A1(ZP), .A2(X2P), .B0(X1), .B1(n2), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[0]), .Y(n1) );
  XNOR2X1 U3 ( .A(NEG), .B(x[1]), .Y(n2) );
endmodule


module Booth_encoder_1 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_2 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_3 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_4 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_5 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_6 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_encoder_7 ( y, NEG, X1, X2P, ZP );
  input [2:0] y;
  output NEG, X1, X2P, ZP;

  assign NEG = y[2];

  INVX1 U1 ( .A(X2P), .Y(X1) );
  XOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(X2P) );
  XNOR2X1 U3 ( .A(y[1]), .B(y[2]), .Y(ZP) );
endmodule


module Booth_decoder_1 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_2 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_3 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_4 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_5 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_6 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_7 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_8 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_9 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_10 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_11 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_12 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_13 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_14 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_15 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_16 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_17 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_18 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_19 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_20 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_21 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_22 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_23 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_24 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_25 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_26 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_27 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_28 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_29 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_30 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_31 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_32 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_33 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_34 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_35 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_36 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_37 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_38 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_39 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_40 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_41 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_42 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_43 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_44 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_45 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_46 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_47 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_48 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_49 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_50 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_51 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_52 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_53 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_54 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_55 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_56 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_57 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_58 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_59 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_60 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_61 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_62 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_63 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_64 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_65 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_66 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_67 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_68 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_69 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_70 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_71 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_72 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_73 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_74 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_75 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_76 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_77 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_78 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_79 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_80 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_81 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_82 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_83 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_84 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_85 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_86 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_87 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_88 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_89 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_90 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_91 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_92 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_93 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_94 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_95 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_96 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_97 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_98 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_99 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_100 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_101 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_102 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_103 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_104 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_105 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_106 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_107 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_108 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_109 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_110 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_111 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_112 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_113 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_114 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_115 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_116 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_117 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_118 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module Booth_decoder_119 ( x, NEG, X1, X2P, ZP, PP );
  input [1:0] x;
  input NEG, X1, X2P, ZP;
  output PP;
  wire   n4, n5;

  OAI32X1 U1 ( .A0(n5), .A1(ZP), .A2(X2P), .B0(X1), .B1(n4), .Y(PP) );
  XNOR2X1 U2 ( .A(NEG), .B(x[1]), .Y(n4) );
  XNOR2X1 U3 ( .A(NEG), .B(x[0]), .Y(n5) );
endmodule


module complement_1 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_2 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_3 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_4 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_5 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_6 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module complement_7 ( x, y, ADD );
  input [2:0] y;
  input x;
  output ADD;
  wire   n3, n4;

  NOR2BX1 U1 ( .AN(y[2]), .B(n4), .Y(ADD) );
  AOI2BB1X1 U2 ( .A0N(x), .A1N(y[0]), .B0(n3), .Y(n4) );
  AOI21X1 U3 ( .A0(y[0]), .A1(x), .B0(y[1]), .Y(n3) );
endmodule


module row_LSB_1 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_2 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_3 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_4 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_5 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_6 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module row_LSB_7 ( x, y, lsb );
  input [1:0] y;
  input x;
  output lsb;
  wire   n2;

  NOR2BX1 U1 ( .AN(x), .B(n2), .Y(lsb) );
  XNOR2X1 U2 ( .A(y[1]), .B(y[0]), .Y(n2) );
endmodule


module Booth_multiplier ( X, Y, row0, row1, row2, row3, row4, row5, row6, row7, 
        add );
  input [15:0] X;
  input [15:0] Y;
  output [16:0] row0;
  output [16:0] row1;
  output [16:0] row2;
  output [16:0] row3;
  output [16:0] row4;
  output [16:0] row5;
  output [16:0] row6;
  output [16:0] row7;
  output [7:0] add;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23;
  wire   [7:0] neg;
  wire   [7:0] x1;
  wire   [7:0] x2p;
  wire   [7:0] zp;

  Booth_encoder_0 \Booth_Encoder_Loop[0].BE  ( .y({Y[1:0], 1'b0}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]) );
  Booth_encoder_7 \Booth_Encoder_Loop[1].BE  ( .y(Y[3:1]), .NEG(neg[1]), .X1(
        x1[1]), .X2P(x2p[1]), .ZP(zp[1]) );
  Booth_encoder_6 \Booth_Encoder_Loop[2].BE  ( .y(Y[5:3]), .NEG(neg[2]), .X1(
        x1[2]), .X2P(x2p[2]), .ZP(zp[2]) );
  Booth_encoder_5 \Booth_Encoder_Loop[3].BE  ( .y(Y[7:5]), .NEG(neg[3]), .X1(
        x1[3]), .X2P(x2p[3]), .ZP(zp[3]) );
  Booth_encoder_4 \Booth_Encoder_Loop[4].BE  ( .y(Y[9:7]), .NEG(neg[4]), .X1(
        x1[4]), .X2P(x2p[4]), .ZP(zp[4]) );
  Booth_encoder_3 \Booth_Encoder_Loop[5].BE  ( .y(Y[11:9]), .NEG(neg[5]), .X1(
        x1[5]), .X2P(x2p[5]), .ZP(zp[5]) );
  Booth_encoder_2 \Booth_Encoder_Loop[6].BE  ( .y(Y[13:11]), .NEG(neg[6]), 
        .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]) );
  Booth_encoder_1 \Booth_Encoder_Loop[7].BE  ( .y(Y[15:13]), .NEG(neg[7]), 
        .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]) );
  row_LSB_0 \Booth_Decoder_Row[0].LSB  ( .x(X[0]), .y({Y[0], 1'b0}), .lsb(
        row0[0]) );
  complement_0 \Booth_Decoder_Row[0].CM  ( .x(X[0]), .y({Y[1:0], 1'b0}), .ADD(
        add[0]) );
  Booth_decoder_0 \Booth_Decoder_Row[0].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[1]) );
  Booth_decoder_119 \Booth_Decoder_Row[0].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[2])
         );
  Booth_decoder_118 \Booth_Decoder_Row[0].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[3]) );
  Booth_decoder_117 \Booth_Decoder_Row[0].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[4]) );
  Booth_decoder_116 \Booth_Decoder_Row[0].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[5]) );
  Booth_decoder_115 \Booth_Decoder_Row[0].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[6]) );
  Booth_decoder_114 \Booth_Decoder_Row[0].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[7]) );
  Booth_decoder_113 \Booth_Decoder_Row[0].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[8]) );
  Booth_decoder_112 \Booth_Decoder_Row[0].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(row0[9]) );
  Booth_decoder_111 \Booth_Decoder_Row[0].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[10]) );
  Booth_decoder_110 \Booth_Decoder_Row[0].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[11]) );
  Booth_decoder_109 \Booth_Decoder_Row[0].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[12]) );
  Booth_decoder_108 \Booth_Decoder_Row[0].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[13]) );
  Booth_decoder_107 \Booth_Decoder_Row[0].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[14]) );
  Booth_decoder_106 \Booth_Decoder_Row[0].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[0]), .X1(x1[0]), .X2P(x2p[0]), .ZP(zp[0]), .PP(
        row0[15]) );
  row_LSB_7 \Booth_Decoder_Row[1].LSB  ( .x(X[0]), .y(Y[2:1]), .lsb(row1[0])
         );
  complement_7 \Booth_Decoder_Row[1].CM  ( .x(X[0]), .y(Y[3:1]), .ADD(add[1])
         );
  Booth_decoder_105 \Booth_Decoder_Row[1].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[1]) );
  Booth_decoder_104 \Booth_Decoder_Row[1].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[2])
         );
  Booth_decoder_103 \Booth_Decoder_Row[1].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[3]) );
  Booth_decoder_102 \Booth_Decoder_Row[1].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[4]) );
  Booth_decoder_101 \Booth_Decoder_Row[1].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[5]) );
  Booth_decoder_100 \Booth_Decoder_Row[1].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[6]) );
  Booth_decoder_99 \Booth_Decoder_Row[1].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[7]) );
  Booth_decoder_98 \Booth_Decoder_Row[1].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[8]) );
  Booth_decoder_97 \Booth_Decoder_Row[1].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(row1[9]) );
  Booth_decoder_96 \Booth_Decoder_Row[1].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[10]) );
  Booth_decoder_95 \Booth_Decoder_Row[1].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[11]) );
  Booth_decoder_94 \Booth_Decoder_Row[1].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[12]) );
  Booth_decoder_93 \Booth_Decoder_Row[1].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[13]) );
  Booth_decoder_92 \Booth_Decoder_Row[1].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[14]) );
  Booth_decoder_91 \Booth_Decoder_Row[1].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[1]), .X1(x1[1]), .X2P(x2p[1]), .ZP(zp[1]), .PP(
        row1[15]) );
  row_LSB_6 \Booth_Decoder_Row[2].LSB  ( .x(X[0]), .y(Y[4:3]), .lsb(row2[0])
         );
  complement_6 \Booth_Decoder_Row[2].CM  ( .x(X[0]), .y(Y[5:3]), .ADD(add[2])
         );
  Booth_decoder_90 \Booth_Decoder_Row[2].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[1]) );
  Booth_decoder_89 \Booth_Decoder_Row[2].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[2])
         );
  Booth_decoder_88 \Booth_Decoder_Row[2].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[3]) );
  Booth_decoder_87 \Booth_Decoder_Row[2].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[4]) );
  Booth_decoder_86 \Booth_Decoder_Row[2].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[5]) );
  Booth_decoder_85 \Booth_Decoder_Row[2].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[6]) );
  Booth_decoder_84 \Booth_Decoder_Row[2].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[7]) );
  Booth_decoder_83 \Booth_Decoder_Row[2].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[8]) );
  Booth_decoder_82 \Booth_Decoder_Row[2].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(row2[9]) );
  Booth_decoder_81 \Booth_Decoder_Row[2].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[10]) );
  Booth_decoder_80 \Booth_Decoder_Row[2].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[11]) );
  Booth_decoder_79 \Booth_Decoder_Row[2].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[12]) );
  Booth_decoder_78 \Booth_Decoder_Row[2].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[13]) );
  Booth_decoder_77 \Booth_Decoder_Row[2].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[14]) );
  Booth_decoder_76 \Booth_Decoder_Row[2].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[2]), .X1(x1[2]), .X2P(x2p[2]), .ZP(zp[2]), .PP(
        row2[15]) );
  row_LSB_5 \Booth_Decoder_Row[3].LSB  ( .x(X[0]), .y(Y[6:5]), .lsb(row3[0])
         );
  complement_5 \Booth_Decoder_Row[3].CM  ( .x(X[0]), .y(Y[7:5]), .ADD(add[3])
         );
  Booth_decoder_75 \Booth_Decoder_Row[3].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[1]) );
  Booth_decoder_74 \Booth_Decoder_Row[3].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[2])
         );
  Booth_decoder_73 \Booth_Decoder_Row[3].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[3]) );
  Booth_decoder_72 \Booth_Decoder_Row[3].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[4]) );
  Booth_decoder_71 \Booth_Decoder_Row[3].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[5]) );
  Booth_decoder_70 \Booth_Decoder_Row[3].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[6]) );
  Booth_decoder_69 \Booth_Decoder_Row[3].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[7]) );
  Booth_decoder_68 \Booth_Decoder_Row[3].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[8]) );
  Booth_decoder_67 \Booth_Decoder_Row[3].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(row3[9]) );
  Booth_decoder_66 \Booth_Decoder_Row[3].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[10]) );
  Booth_decoder_65 \Booth_Decoder_Row[3].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[11]) );
  Booth_decoder_64 \Booth_Decoder_Row[3].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[12]) );
  Booth_decoder_63 \Booth_Decoder_Row[3].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[13]) );
  Booth_decoder_62 \Booth_Decoder_Row[3].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[14]) );
  Booth_decoder_61 \Booth_Decoder_Row[3].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[3]), .X1(x1[3]), .X2P(x2p[3]), .ZP(zp[3]), .PP(
        row3[15]) );
  row_LSB_4 \Booth_Decoder_Row[4].LSB  ( .x(X[0]), .y(Y[8:7]), .lsb(row4[0])
         );
  complement_4 \Booth_Decoder_Row[4].CM  ( .x(X[0]), .y(Y[9:7]), .ADD(add[4])
         );
  Booth_decoder_60 \Booth_Decoder_Row[4].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[1]) );
  Booth_decoder_59 \Booth_Decoder_Row[4].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[2])
         );
  Booth_decoder_58 \Booth_Decoder_Row[4].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[3]) );
  Booth_decoder_57 \Booth_Decoder_Row[4].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[4]) );
  Booth_decoder_56 \Booth_Decoder_Row[4].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[5]) );
  Booth_decoder_55 \Booth_Decoder_Row[4].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[6]) );
  Booth_decoder_54 \Booth_Decoder_Row[4].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[7]) );
  Booth_decoder_53 \Booth_Decoder_Row[4].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[8]) );
  Booth_decoder_52 \Booth_Decoder_Row[4].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(row4[9]) );
  Booth_decoder_51 \Booth_Decoder_Row[4].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[10]) );
  Booth_decoder_50 \Booth_Decoder_Row[4].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[11]) );
  Booth_decoder_49 \Booth_Decoder_Row[4].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[12]) );
  Booth_decoder_48 \Booth_Decoder_Row[4].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[13]) );
  Booth_decoder_47 \Booth_Decoder_Row[4].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[14]) );
  Booth_decoder_46 \Booth_Decoder_Row[4].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[4]), .X1(x1[4]), .X2P(x2p[4]), .ZP(zp[4]), .PP(
        row4[15]) );
  row_LSB_3 \Booth_Decoder_Row[5].LSB  ( .x(X[0]), .y(Y[10:9]), .lsb(row5[0])
         );
  complement_3 \Booth_Decoder_Row[5].CM  ( .x(X[0]), .y(Y[11:9]), .ADD(add[5])
         );
  Booth_decoder_45 \Booth_Decoder_Row[5].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[1]) );
  Booth_decoder_44 \Booth_Decoder_Row[5].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[2])
         );
  Booth_decoder_43 \Booth_Decoder_Row[5].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[3]) );
  Booth_decoder_42 \Booth_Decoder_Row[5].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[4]) );
  Booth_decoder_41 \Booth_Decoder_Row[5].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[5]) );
  Booth_decoder_40 \Booth_Decoder_Row[5].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[6]) );
  Booth_decoder_39 \Booth_Decoder_Row[5].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[7]) );
  Booth_decoder_38 \Booth_Decoder_Row[5].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[8]) );
  Booth_decoder_37 \Booth_Decoder_Row[5].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(row5[9]) );
  Booth_decoder_36 \Booth_Decoder_Row[5].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[10]) );
  Booth_decoder_35 \Booth_Decoder_Row[5].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[11]) );
  Booth_decoder_34 \Booth_Decoder_Row[5].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[12]) );
  Booth_decoder_33 \Booth_Decoder_Row[5].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[13]) );
  Booth_decoder_32 \Booth_Decoder_Row[5].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[14]) );
  Booth_decoder_31 \Booth_Decoder_Row[5].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[5]), .X1(x1[5]), .X2P(x2p[5]), .ZP(zp[5]), .PP(
        row5[15]) );
  row_LSB_2 \Booth_Decoder_Row[6].LSB  ( .x(X[0]), .y(Y[12:11]), .lsb(row6[0])
         );
  complement_2 \Booth_Decoder_Row[6].CM  ( .x(X[0]), .y(Y[13:11]), .ADD(add[6]) );
  Booth_decoder_30 \Booth_Decoder_Row[6].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[1]) );
  Booth_decoder_29 \Booth_Decoder_Row[6].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[2])
         );
  Booth_decoder_28 \Booth_Decoder_Row[6].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[3]) );
  Booth_decoder_27 \Booth_Decoder_Row[6].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[4]) );
  Booth_decoder_26 \Booth_Decoder_Row[6].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[5]) );
  Booth_decoder_25 \Booth_Decoder_Row[6].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[6]) );
  Booth_decoder_24 \Booth_Decoder_Row[6].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[7]) );
  Booth_decoder_23 \Booth_Decoder_Row[6].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[8]) );
  Booth_decoder_22 \Booth_Decoder_Row[6].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(row6[9]) );
  Booth_decoder_21 \Booth_Decoder_Row[6].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[10]) );
  Booth_decoder_20 \Booth_Decoder_Row[6].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[11]) );
  Booth_decoder_19 \Booth_Decoder_Row[6].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[12]) );
  Booth_decoder_18 \Booth_Decoder_Row[6].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[13]) );
  Booth_decoder_17 \Booth_Decoder_Row[6].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[14]) );
  Booth_decoder_16 \Booth_Decoder_Row[6].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[6]), .X1(x1[6]), .X2P(x2p[6]), .ZP(zp[6]), .PP(
        row6[15]) );
  row_LSB_1 \Booth_Decoder_Row[7].LSB  ( .x(X[0]), .y(Y[14:13]), .lsb(row7[0])
         );
  complement_1 \Booth_Decoder_Row[7].CM  ( .x(X[0]), .y(Y[15:13]), .ADD(add[7]) );
  Booth_decoder_15 \Booth_Decoder_Row[7].Booth_Decoder_Bit[1].BD  ( .x({n9, 
        X[0]}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[1]) );
  Booth_decoder_14 \Booth_Decoder_Row[7].Booth_Decoder_Bit[2].BD  ( .x({n10, 
        n9}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[2])
         );
  Booth_decoder_13 \Booth_Decoder_Row[7].Booth_Decoder_Bit[3].BD  ( .x({n11, 
        n10}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[3]) );
  Booth_decoder_12 \Booth_Decoder_Row[7].Booth_Decoder_Bit[4].BD  ( .x({n12, 
        n11}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[4]) );
  Booth_decoder_11 \Booth_Decoder_Row[7].Booth_Decoder_Bit[5].BD  ( .x({n13, 
        n12}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[5]) );
  Booth_decoder_10 \Booth_Decoder_Row[7].Booth_Decoder_Bit[6].BD  ( .x({n14, 
        n13}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[6]) );
  Booth_decoder_9 \Booth_Decoder_Row[7].Booth_Decoder_Bit[7].BD  ( .x({n15, 
        n14}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[7]) );
  Booth_decoder_8 \Booth_Decoder_Row[7].Booth_Decoder_Bit[8].BD  ( .x({n16, 
        n15}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[8]) );
  Booth_decoder_7 \Booth_Decoder_Row[7].Booth_Decoder_Bit[9].BD  ( .x({n17, 
        n16}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(row7[9]) );
  Booth_decoder_6 \Booth_Decoder_Row[7].Booth_Decoder_Bit[10].BD  ( .x({n18, 
        n17}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[10]) );
  Booth_decoder_5 \Booth_Decoder_Row[7].Booth_Decoder_Bit[11].BD  ( .x({n19, 
        n18}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[11]) );
  Booth_decoder_4 \Booth_Decoder_Row[7].Booth_Decoder_Bit[12].BD  ( .x({n20, 
        n19}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[12]) );
  Booth_decoder_3 \Booth_Decoder_Row[7].Booth_Decoder_Bit[13].BD  ( .x({n21, 
        n20}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[13]) );
  Booth_decoder_2 \Booth_Decoder_Row[7].Booth_Decoder_Bit[14].BD  ( .x({n22, 
        n21}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[14]) );
  Booth_decoder_1 \Booth_Decoder_Row[7].Booth_Decoder_Bit[15].BD  ( .x({n23, 
        n22}), .NEG(neg[7]), .X1(x1[7]), .X2P(x2p[7]), .ZP(zp[7]), .PP(
        row7[15]) );
  OAI2BB1X1 U2 ( .A0N(zp[0]), .A1N(x1[0]), .B0(n8), .Y(row0[16]) );
  XOR2X1 U3 ( .A(neg[0]), .B(n23), .Y(n8) );
  OAI2BB1X1 U4 ( .A0N(zp[1]), .A1N(x1[1]), .B0(n7), .Y(row1[16]) );
  XOR2X1 U5 ( .A(neg[1]), .B(n23), .Y(n7) );
  OAI2BB1X1 U6 ( .A0N(zp[2]), .A1N(x1[2]), .B0(n6), .Y(row2[16]) );
  XOR2X1 U7 ( .A(neg[2]), .B(n23), .Y(n6) );
  OAI2BB1X1 U8 ( .A0N(zp[4]), .A1N(x1[4]), .B0(n4), .Y(row4[16]) );
  XOR2X1 U9 ( .A(neg[4]), .B(n23), .Y(n4) );
  OAI2BB1X1 U10 ( .A0N(zp[5]), .A1N(x1[5]), .B0(n3), .Y(row5[16]) );
  XOR2X1 U11 ( .A(neg[5]), .B(n23), .Y(n3) );
  OAI2BB1X1 U12 ( .A0N(zp[6]), .A1N(x1[6]), .B0(n2), .Y(row6[16]) );
  XOR2X1 U13 ( .A(neg[6]), .B(n23), .Y(n2) );
  OAI2BB1X1 U14 ( .A0N(zp[3]), .A1N(x1[3]), .B0(n5), .Y(row3[16]) );
  XOR2X1 U15 ( .A(neg[3]), .B(n23), .Y(n5) );
  OAI2BB1X1 U16 ( .A0N(zp[7]), .A1N(x1[7]), .B0(n1), .Y(row7[16]) );
  XOR2X1 U17 ( .A(neg[7]), .B(n23), .Y(n1) );
  BUFX3 U18 ( .A(X[15]), .Y(n23) );
  BUFX3 U19 ( .A(X[13]), .Y(n21) );
  BUFX3 U20 ( .A(X[12]), .Y(n20) );
  BUFX3 U21 ( .A(X[14]), .Y(n22) );
  BUFX3 U22 ( .A(X[11]), .Y(n19) );
  BUFX3 U23 ( .A(X[5]), .Y(n13) );
  BUFX3 U24 ( .A(X[9]), .Y(n17) );
  BUFX3 U25 ( .A(X[7]), .Y(n15) );
  BUFX3 U26 ( .A(X[8]), .Y(n16) );
  BUFX3 U27 ( .A(X[10]), .Y(n18) );
  BUFX3 U28 ( .A(X[6]), .Y(n14) );
  BUFX3 U29 ( .A(X[4]), .Y(n12) );
  BUFX3 U30 ( .A(X[3]), .Y(n11) );
  BUFX3 U31 ( .A(X[2]), .Y(n10) );
  BUFX3 U32 ( .A(X[1]), .Y(n9) );
endmodule


module half_adder_0 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module full_adder_0 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module compressor4_2_0 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n1, n2, n3, n4, n5;

  OAI2BB1X1 U1 ( .A0N(b), .A1N(a), .B0(n3), .Y(cout) );
  OAI21XL U2 ( .A0(a), .A1(b), .B0(c), .Y(n3) );
  XOR2X1 U3 ( .A(a), .B(n5), .Y(n1) );
  XOR2X1 U4 ( .A(c), .B(b), .Y(n5) );
  OAI2BB1X1 U5 ( .A0N(n1), .A1N(cin), .B0(n4), .Y(carry) );
  OAI21XL U6 ( .A0(cin), .A1(n1), .B0(d), .Y(n4) );
  XOR2X1 U7 ( .A(n1), .B(n2), .Y(sum) );
  XOR2X1 U8 ( .A(d), .B(cin), .Y(n2) );
endmodule


module half_adder_1 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_2 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_3 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_4 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_5 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_6 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_7 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_8 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_9 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module half_adder_10 ( a, b, sum, cout );
  input a, b;
  output sum, cout;


  CMPR22X1 U1 ( .S(sum), .CO(cout), .A(a), .B(b));
endmodule


module full_adder_1 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_2 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_3 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_4 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_5 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_6 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module full_adder_7 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1, n3;

  CMPR32X1 U1 (.S(sum), .CO(cout), .A(a), .B(b), .C(cin));
endmodule


module compressor4_2_1 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_2 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_3 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_4 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_5 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_6 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_7 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_8 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_9 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_10 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_11 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_12 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_13 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_14 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_15 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_16 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_17 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_18 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_19 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_20 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_21 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_22 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_23 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_24 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_25 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_26 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_27 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_28 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_29 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_30 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_31 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_32 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_33 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_34 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_35 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_36 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_37 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_38 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_39 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_40 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_41 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_42 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_43 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_44 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_45 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_46 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_47 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_48 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_49 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_50 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_51 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_52 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_53 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_54 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_55 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_56 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_57 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_58 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_59 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_60 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_61 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_62 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_63 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_64 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_65 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_66 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_67 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_68 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_69 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_70 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_71 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_72 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_73 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_74 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_75 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_76 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_77 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_78 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module compressor4_2_79 ( a, b, c, d, cin, cout, sum, carry );
  input a, b, c, d, cin;
  output cout, sum, carry;
  wire   n6, n7, n8, n9, n10;

  CMPR42X1 (.S(sum), .CO(carry), .ICO(cout), .A(a), .B(b), .C(c), .D(d), .ICI(cin));
endmodule


module Dadda ( row0, row1, row2, row3, row4, row5, row6, row7, add, in_sumRow, 
        in_carryRow, out_sumRow, out_carryRow );
  input [16:0] row0;
  input [16:0] row1;
  input [16:0] row2;
  input [16:0] row3;
  input [16:0] row4;
  input [16:0] row5;
  input [16:0] row6;
  input [16:0] row7;
  input [7:0] add;
  input [32:0] in_sumRow;
  input [32:1] in_carryRow;
  output [32:0] out_sumRow;
  output [32:1] out_carryRow;

  wire   [22:11] stage1_sum;
  wire   [23:12] stage1_carry;
  wire   [21:14] stage1_cout;
  wire   [19:16] stage1_carry2;
  wire   [18:15] stage1_sum2;
  wire   [30:3] stage2_sum;
  wire   [31:4] stage2_carry;
  wire   [30:6] stage2_cout;
  wire   [28:7] stage2_sum2;
  wire   [29:8] stage2_carry2;
  wire   [25:10] stage2_cout2;
  wire   [32:2] stage3_cout;

  half_adder_0 S1_HA1 ( .a(row0[11]), .b(row1[9]), .sum(stage1_sum[11]), 
        .cout(stage1_carry[12]) );
  full_adder_0 S1_FA1 ( .a(row0[12]), .b(row1[10]), .cin(row2[8]), .sum(
        stage1_sum[12]), .cout(stage1_carry[13]) );
  compressor4_2_0 \stage1_42compressor[13].genblk1.S1_42C  ( .a(row0[13]), .b(
        row1[11]), .c(row2[9]), .d(row3[7]), .cin(1'b0), .cout(stage1_cout[14]), .sum(stage1_sum[13]), .carry(stage1_carry[14]) );
  compressor4_2_79 \stage1_42compressor[14].genblk1.S1_42C  ( .a(row0[14]), 
        .b(row1[12]), .c(row2[10]), .d(row3[8]), .cin(stage1_cout[14]), .cout(
        stage1_cout[15]), .sum(stage1_sum[14]), .carry(stage1_carry[15]) );
  compressor4_2_78 \stage1_42compressor[15].genblk1.S1_42C  ( .a(row0[15]), 
        .b(row1[13]), .c(row2[11]), .d(row3[9]), .cin(stage1_cout[15]), .cout(
        stage1_cout[16]), .sum(stage1_sum[15]), .carry(stage1_carry[16]) );
  compressor4_2_77 \stage1_42compressor[16].genblk1.S1_42C  ( .a(row0[16]), 
        .b(row1[14]), .c(row2[12]), .d(row3[10]), .cin(stage1_cout[16]), 
        .cout(stage1_cout[17]), .sum(stage1_sum[16]), .carry(stage1_carry[17])
         );
  compressor4_2_76 \stage1_42compressor[17].genblk1.S1_42C  ( .a(row1[15]), 
        .b(row2[13]), .c(row3[11]), .d(row4[9]), .cin(stage1_cout[17]), .cout(
        stage1_cout[18]), .sum(stage1_sum[17]), .carry(stage1_carry[18]) );
  compressor4_2_75 \stage1_42compressor[18].genblk1.S1_42C  ( .a(row1[16]), 
        .b(row2[14]), .c(row3[12]), .d(row4[10]), .cin(stage1_cout[18]), 
        .cout(stage1_cout[19]), .sum(stage1_sum[18]), .carry(stage1_carry[19])
         );
  compressor4_2_74 \stage1_42compressor[19].genblk1.S1_42C_if19  ( .a(row2[15]), .b(row3[13]), .c(row4[11]), .d(stage1_carry2[19]), .cin(stage1_cout[19]), 
        .cout(stage1_cout[20]), .sum(stage1_sum[19]), .carry(stage1_carry[20])
         );
  compressor4_2_73 \stage1_42compressor[20].genblk1.S1_42C_if20  ( .a(row2[16]), .b(row3[14]), .c(row4[12]), .d(1'b0), .cin(stage1_cout[20]), .cout(
        stage1_cout[21]), .sum(stage1_sum[20]), .carry(stage1_carry[21]) );
  full_adder_7 S1_FA2 ( .a(row3[15]), .b(row4[13]), .cin(row5[11]), .sum(
        stage1_sum[21]), .cout(stage1_carry[22]) );
  half_adder_10 S1_HA2 ( .a(row3[16]), .b(row4[14]), .sum(stage1_sum[22]), 
        .cout(stage1_carry[23]) );
  half_adder_9 S1_HA3 ( .a(row4[7]), .b(row5[5]), .sum(stage1_sum2[15]), 
        .cout(stage1_carry2[16]) );
  full_adder_6 S1_FA3 ( .a(row4[8]), .b(row5[6]), .cin(row6[4]), .sum(
        stage1_sum2[16]), .cout(stage1_carry2[17]) );
  half_adder_8 S1_HA4 ( .a(row5[7]), .b(row6[5]), .sum(stage1_sum2[17]), 
        .cout(stage1_carry2[18]) );
  half_adder_7 S1_HA5 ( .a(row5[8]), .b(row6[6]), .sum(stage1_sum2[18]), 
        .cout(stage1_carry2[19]) );
  half_adder_6 S2_HA1 ( .a(row0[3]), .b(row1[1]), .sum(stage2_sum[3]), .cout(
        stage2_carry[4]) );
  full_adder_5 S2_FA1 ( .a(row0[4]), .b(row1[2]), .cin(row2[0]), .sum(
        stage2_sum[4]), .cout(stage2_carry[5]) );
  compressor4_2_72 \stage2_42compressor_layer1[5].genblk1.S2_42C  ( .a(row0[5]), .b(row1[3]), .c(row2[1]), .d(add[2]), .cin(1'b0), .cout(stage2_cout[6]), 
        .sum(stage2_sum[5]), .carry(stage2_carry[6]) );
  compressor4_2_71 \stage2_42compressor_layer1[6].genblk1.S2_42C  ( .a(row0[6]), .b(row1[4]), .c(row2[2]), .d(row3[0]), .cin(stage2_cout[6]), .cout(
        stage2_cout[7]), .sum(stage2_sum[6]), .carry(stage2_carry[7]) );
  compressor4_2_70 \stage2_42compressor_layer1[7].genblk1.S2_42C  ( .a(row0[7]), .b(row1[5]), .c(row2[3]), .d(row3[1]), .cin(stage2_cout[7]), .cout(
        stage2_cout[8]), .sum(stage2_sum[7]), .carry(stage2_carry[8]) );
  compressor4_2_69 \stage2_42compressor_layer1[8].genblk1.S2_42C  ( .a(row0[8]), .b(row1[6]), .c(row2[4]), .d(row3[2]), .cin(stage2_cout[8]), .cout(
        stage2_cout[9]), .sum(stage2_sum[8]), .carry(stage2_carry[9]) );
  compressor4_2_68 \stage2_42compressor_layer1[9].genblk1.S2_42C  ( .a(row0[9]), .b(row1[7]), .c(row2[5]), .d(row3[3]), .cin(stage2_cout[9]), .cout(
        stage2_cout[10]), .sum(stage2_sum[9]), .carry(stage2_carry[10]) );
  compressor4_2_67 \stage2_42compressor_layer1[10].genblk1.S2_42C  ( .a(
        row0[10]), .b(row1[8]), .c(row2[6]), .d(row3[4]), .cin(stage2_cout[10]), .cout(stage2_cout[11]), .sum(stage2_sum[10]), .carry(stage2_carry[11]) );
  compressor4_2_66 \stage2_42compressor_layer1[11].genblk1.S2_42C  ( .a(
        stage1_sum[11]), .b(row2[7]), .c(row3[5]), .d(row4[3]), .cin(
        stage2_cout[11]), .cout(stage2_cout[12]), .sum(stage2_sum[11]), 
        .carry(stage2_carry[12]) );
  compressor4_2_65 \stage2_42compressor_layer1[12].genblk1.S2_42C  ( .a(
        stage1_sum[12]), .b(stage1_carry[12]), .c(row3[6]), .d(row4[4]), .cin(
        stage2_cout[12]), .cout(stage2_cout[13]), .sum(stage2_sum[12]), 
        .carry(stage2_carry[13]) );
  compressor4_2_64 \stage2_42compressor_layer1[13].genblk1.S2_42C  ( .a(
        stage1_sum[13]), .b(stage1_carry[13]), .c(row4[5]), .d(row5[3]), .cin(
        stage2_cout[13]), .cout(stage2_cout[14]), .sum(stage2_sum[13]), 
        .carry(stage2_carry[14]) );
  compressor4_2_63 \stage2_42compressor_layer1[14].genblk1.S2_42C  ( .a(
        stage1_sum[14]), .b(stage1_carry[14]), .c(row4[6]), .d(row5[4]), .cin(
        stage2_cout[14]), .cout(stage2_cout[15]), .sum(stage2_sum[14]), 
        .carry(stage2_carry[15]) );
  compressor4_2_62 \stage2_42compressor_layer1[15].genblk1.S2_42C  ( .a(
        stage1_sum[15]), .b(stage1_carry[15]), .c(stage1_sum2[15]), .d(row6[3]), .cin(stage2_cout[15]), .cout(stage2_cout[16]), .sum(stage2_sum[15]), .carry(
        stage2_carry[16]) );
  compressor4_2_61 \stage2_42compressor_layer1[16].genblk1.S2_42C  ( .a(
        stage1_sum[16]), .b(stage1_carry[16]), .c(stage1_sum2[16]), .d(
        stage1_carry2[16]), .cin(stage2_cout[16]), .cout(stage2_cout[17]), 
        .sum(stage2_sum[16]), .carry(stage2_carry[17]) );
  compressor4_2_60 \stage2_42compressor_layer1[17].genblk1.S2_42C  ( .a(
        stage1_sum[17]), .b(stage1_carry[17]), .c(stage1_sum2[17]), .d(
        stage1_carry2[17]), .cin(stage2_cout[17]), .cout(stage2_cout[18]), 
        .sum(stage2_sum[17]), .carry(stage2_carry[18]) );
  compressor4_2_59 \stage2_42compressor_layer1[18].genblk1.S2_42C  ( .a(
        stage1_sum[18]), .b(stage1_carry[18]), .c(stage1_sum2[18]), .d(
        stage1_carry2[18]), .cin(stage2_cout[18]), .cout(stage2_cout[19]), 
        .sum(stage2_sum[18]), .carry(stage2_carry[19]) );
  compressor4_2_58 \stage2_42compressor_layer1[19].genblk1.S2_42C  ( .a(
        stage1_sum[19]), .b(stage1_carry[19]), .c(row5[9]), .d(row6[7]), .cin(
        stage2_cout[19]), .cout(stage2_cout[20]), .sum(stage2_sum[19]), 
        .carry(stage2_carry[20]) );
  compressor4_2_57 \stage2_42compressor_layer1[20].genblk1.S2_42C  ( .a(
        stage1_sum[20]), .b(stage1_carry[20]), .c(row5[10]), .d(row6[8]), 
        .cin(stage2_cout[20]), .cout(stage2_cout[21]), .sum(stage2_sum[20]), 
        .carry(stage2_carry[21]) );
  compressor4_2_56 \stage2_42compressor_layer1[21].genblk1.S2_42C  ( .a(
        stage1_sum[21]), .b(stage1_carry[21]), .c(stage1_cout[21]), .d(row6[9]), .cin(stage2_cout[21]), .cout(stage2_cout[22]), .sum(stage2_sum[21]), .carry(
        stage2_carry[22]) );
  compressor4_2_55 \stage2_42compressor_layer1[22].genblk1.S2_42C  ( .a(
        stage1_sum[22]), .b(stage1_carry[22]), .c(row5[12]), .d(row6[10]), 
        .cin(stage2_cout[22]), .cout(stage2_cout[23]), .sum(stage2_sum[22]), 
        .carry(stage2_carry[23]) );
  compressor4_2_54 \stage2_42compressor_layer1[23].genblk1.S2_42C  ( .a(
        row4[15]), .b(row5[13]), .c(row6[11]), .d(row7[9]), .cin(
        stage2_cout[23]), .cout(stage2_cout[24]), .sum(stage2_sum[23]), 
        .carry(stage2_carry[24]) );
  compressor4_2_53 \stage2_42compressor_layer1[24].genblk1.S2_42C  ( .a(
        row4[16]), .b(row5[14]), .c(row6[12]), .d(row7[10]), .cin(
        stage2_cout[24]), .cout(stage2_cout[25]), .sum(stage2_sum[24]), 
        .carry(stage2_carry[25]) );
  compressor4_2_52 \stage2_42compressor_layer1[25].genblk1.S2_42C  ( .a(
        row5[15]), .b(row6[13]), .c(row7[11]), .d(1'b1), .cin(stage2_cout[25]), 
        .cout(stage2_cout[26]), .sum(stage2_sum[25]), .carry(stage2_carry[26])
         );
  compressor4_2_51 \stage2_42compressor_layer1[26].genblk1.S2_42C  ( .a(
        row5[16]), .b(row6[14]), .c(row7[12]), .d(1'b0), .cin(stage2_cout[26]), 
        .cout(stage2_cout[27]), .sum(stage2_sum[26]), .carry(stage2_carry[27])
         );
  compressor4_2_50 \stage2_42compressor_layer1[27].genblk1.S2_42C_if  ( .a(
        row6[15]), .b(row7[13]), .c(1'b1), .d(1'b0), .cin(stage2_cout[27]), 
        .cout(stage2_cout[28]), .sum(stage2_sum[27]), .carry(stage2_carry[28])
         );
  compressor4_2_49 \stage2_42compressor_layer1[28].genblk1.S2_42C_if  ( .a(
        row6[16]), .b(row7[14]), .c(1'b0), .d(1'b0), .cin(stage2_cout[28]), 
        .cout(stage2_cout[29]), .sum(stage2_sum[28]), .carry(stage2_carry[29])
         );
  compressor4_2_48 \stage2_42compressor_layer1[29].genblk1.S2_42C_if  ( .a(
        row7[15]), .b(1'b1), .c(in_sumRow[29]), .d(1'b0), .cin(stage2_cout[29]), .cout(stage2_cout[30]), .sum(stage2_sum[29]), .carry(stage2_carry[30]) );
  full_adder_4 S2_FA2 ( .a(row7[16]), .b(1'b0), .cin(in_sumRow[30]), .sum(
        stage2_sum[30]), .cout(stage2_carry[31]) );
  half_adder_5 S2_HA2 ( .a(add[3]), .b(in_sumRow[7]), .sum(stage2_sum2[7]), 
        .cout(stage2_carry2[8]) );
  full_adder_3 S2_FA3 ( .a(row4[0]), .b(in_sumRow[8]), .cin(in_carryRow[8]), 
        .sum(stage2_sum2[8]), .cout(stage2_carry2[9]) );
  compressor4_2_47 \stage2_42compressor_layer2[9].genblk1.S2_42C  ( .a(row4[1]), .b(add[4]), .c(in_sumRow[9]), .d(in_carryRow[9]), .cin(1'b0), .cout(
        stage2_cout2[10]), .sum(stage2_sum2[9]), .carry(stage2_carry2[10]) );
  compressor4_2_46 \stage2_42compressor_layer2[10].genblk1.S2_42C  ( .a(
        row4[2]), .b(row5[0]), .c(in_sumRow[10]), .d(in_carryRow[10]), .cin(
        stage2_cout2[10]), .cout(stage2_cout2[11]), .sum(stage2_sum2[10]), 
        .carry(stage2_carry2[11]) );
  compressor4_2_45 \stage2_42compressor_layer2[11].genblk1.S2_42C  ( .a(
        row5[1]), .b(add[5]), .c(in_sumRow[11]), .d(in_carryRow[11]), .cin(
        stage2_cout2[11]), .cout(stage2_cout2[12]), .sum(stage2_sum2[11]), 
        .carry(stage2_carry2[12]) );
  compressor4_2_44 \stage2_42compressor_layer2[12].genblk1.S2_42C  ( .a(
        row5[2]), .b(row6[0]), .c(in_sumRow[12]), .d(in_carryRow[12]), .cin(
        stage2_cout2[12]), .cout(stage2_cout2[13]), .sum(stage2_sum2[12]), 
        .carry(stage2_carry2[13]) );
  compressor4_2_43 \stage2_42compressor_layer2[13].genblk1.S2_42C  ( .a(
        row6[1]), .b(add[6]), .c(in_sumRow[13]), .d(in_carryRow[13]), .cin(
        stage2_cout2[13]), .cout(stage2_cout2[14]), .sum(stage2_sum2[13]), 
        .carry(stage2_carry2[14]) );
  compressor4_2_42 \stage2_42compressor_layer2[14].genblk1.S2_42C  ( .a(
        row6[2]), .b(row7[0]), .c(in_sumRow[14]), .d(in_carryRow[14]), .cin(
        stage2_cout2[14]), .cout(stage2_cout2[15]), .sum(stage2_sum2[14]), 
        .carry(stage2_carry2[15]) );
  compressor4_2_41 \stage2_42compressor_layer2[15].genblk1.S2_42C  ( .a(
        row7[1]), .b(add[7]), .c(in_sumRow[15]), .d(in_carryRow[15]), .cin(
        stage2_cout2[15]), .cout(stage2_cout2[16]), .sum(stage2_sum2[15]), 
        .carry(stage2_carry2[16]) );
  compressor4_2_40 \stage2_42compressor_layer2[16].genblk1.S2_42C  ( .a(
        row7[2]), .b(1'b1), .c(in_sumRow[16]), .d(in_carryRow[16]), .cin(
        stage2_cout2[16]), .cout(stage2_cout2[17]), .sum(stage2_sum2[16]), 
        .carry(stage2_carry2[17]) );
  compressor4_2_39 \stage2_42compressor_layer2[17].genblk1.S2_42C  ( .a(
        row7[3]), .b(1'b1), .c(in_sumRow[17]), .d(in_carryRow[17]), .cin(
        stage2_cout2[17]), .cout(stage2_cout2[18]), .sum(stage2_sum2[17]), 
        .carry(stage2_carry2[18]) );
  compressor4_2_38 \stage2_42compressor_layer2[18].genblk1.S2_42C  ( .a(
        row7[4]), .b(1'b0), .c(in_sumRow[18]), .d(in_carryRow[18]), .cin(
        stage2_cout2[18]), .cout(stage2_cout2[19]), .sum(stage2_sum2[18]), 
        .carry(stage2_carry2[19]) );
  compressor4_2_37 \stage2_42compressor_layer2[19].genblk1.S2_42C  ( .a(
        row7[5]), .b(1'b1), .c(in_sumRow[19]), .d(in_carryRow[19]), .cin(
        stage2_cout2[19]), .cout(stage2_cout2[20]), .sum(stage2_sum2[19]), 
        .carry(stage2_carry2[20]) );
  compressor4_2_36 \stage2_42compressor_layer2[20].genblk1.S2_42C  ( .a(
        row7[6]), .b(1'b0), .c(in_sumRow[20]), .d(in_carryRow[20]), .cin(
        stage2_cout2[20]), .cout(stage2_cout2[21]), .sum(stage2_sum2[20]), 
        .carry(stage2_carry2[21]) );
  compressor4_2_35 \stage2_42compressor_layer2[21].genblk1.S2_42C  ( .a(
        row7[7]), .b(1'b1), .c(in_sumRow[21]), .d(in_carryRow[21]), .cin(
        stage2_cout2[21]), .cout(stage2_cout2[22]), .sum(stage2_sum2[21]), 
        .carry(stage2_carry2[22]) );
  compressor4_2_34 \stage2_42compressor_layer2[22].genblk1.S2_42C  ( .a(
        row7[8]), .b(1'b0), .c(in_sumRow[22]), .d(in_carryRow[22]), .cin(
        stage2_cout2[22]), .cout(stage2_cout2[23]), .sum(stage2_sum2[22]), 
        .carry(stage2_carry2[23]) );
  compressor4_2_33 \stage2_42compressor_layer2[23].genblk1.S2_42C  ( .a(1'b1), 
        .b(in_sumRow[23]), .c(in_carryRow[23]), .d(stage1_carry[23]), .cin(
        stage2_cout2[23]), .cout(stage2_cout2[24]), .sum(stage2_sum2[23]), 
        .carry(stage2_carry2[24]) );
  compressor4_2_32 \stage2_42compressor_layer2[24].genblk1.S2_42C_if  ( .a(
        1'b0), .b(in_sumRow[24]), .c(in_carryRow[24]), .d(1'b0), .cin(
        stage2_cout2[24]), .cout(stage2_cout2[25]), .sum(stage2_sum2[24]), 
        .carry(stage2_carry2[25]) );
  full_adder_2 S2_FA4 ( .a(in_sumRow[25]), .b(in_carryRow[25]), .cin(
        stage2_cout2[25]), .sum(stage2_sum2[25]), .cout(stage2_carry2[26]) );
  half_adder_4 S2_HA3 ( .a(in_sumRow[26]), .b(in_carryRow[26]), .sum(
        stage2_sum2[26]), .cout(stage2_carry2[27]) );
  half_adder_3 S2_HA4 ( .a(in_sumRow[27]), .b(in_carryRow[27]), .sum(
        stage2_sum2[27]), .cout(stage2_carry2[28]) );
  half_adder_2 S2_HA5 ( .a(in_sumRow[28]), .b(in_carryRow[28]), .sum(
        stage2_sum2[28]), .cout(stage2_carry2[29]) );
  half_adder_1 S3_HA1 ( .a(row0[0]), .b(in_sumRow[0]), .sum(out_sumRow[0]), 
        .cout(out_carryRow[1]) );
  compressor4_2_31 \stage3_42compressor[1].S3_42C  ( .a(row0[1]), .b(add[0]), 
        .c(in_sumRow[1]), .d(in_carryRow[1]), .cin(1'b0), .cout(stage3_cout[2]), .sum(out_sumRow[1]), .carry(out_carryRow[2]) );
  compressor4_2_30 \stage3_42compressor[2].S3_42C  ( .a(row0[2]), .b(row1[0]), 
        .c(in_sumRow[2]), .d(in_carryRow[2]), .cin(stage3_cout[2]), .cout(
        stage3_cout[3]), .sum(out_sumRow[2]), .carry(out_carryRow[3]) );
  compressor4_2_29 \stage3_42compressor[3].S3_42C  ( .a(stage2_sum[3]), .b(
        add[1]), .c(in_sumRow[3]), .d(in_carryRow[3]), .cin(stage3_cout[3]), 
        .cout(stage3_cout[4]), .sum(out_sumRow[3]), .carry(out_carryRow[4]) );
  compressor4_2_28 \stage3_42compressor[4].S3_42C  ( .a(stage2_sum[4]), .b(
        stage2_carry[4]), .c(in_sumRow[4]), .d(in_carryRow[4]), .cin(
        stage3_cout[4]), .cout(stage3_cout[5]), .sum(out_sumRow[4]), .carry(
        out_carryRow[5]) );
  compressor4_2_27 \stage3_42compressor[5].S3_42C  ( .a(stage2_sum[5]), .b(
        stage2_carry[5]), .c(in_sumRow[5]), .d(in_carryRow[5]), .cin(
        stage3_cout[5]), .cout(stage3_cout[6]), .sum(out_sumRow[5]), .carry(
        out_carryRow[6]) );
  compressor4_2_26 \stage3_42compressor[6].S3_42C  ( .a(stage2_sum[6]), .b(
        stage2_carry[6]), .c(in_sumRow[6]), .d(in_carryRow[6]), .cin(
        stage3_cout[6]), .cout(stage3_cout[7]), .sum(out_sumRow[6]), .carry(
        out_carryRow[7]) );
  compressor4_2_25 \stage3_42compressor[7].S3_42C  ( .a(stage2_sum[7]), .b(
        stage2_carry[7]), .c(stage2_sum2[7]), .d(in_carryRow[7]), .cin(
        stage3_cout[7]), .cout(stage3_cout[8]), .sum(out_sumRow[7]), .carry(
        out_carryRow[8]) );
  compressor4_2_24 \stage3_42compressor[8].S3_42C  ( .a(stage2_sum[8]), .b(
        stage2_carry[8]), .c(stage2_sum2[8]), .d(stage2_carry2[8]), .cin(
        stage3_cout[8]), .cout(stage3_cout[9]), .sum(out_sumRow[8]), .carry(
        out_carryRow[9]) );
  compressor4_2_23 \stage3_42compressor[9].S3_42C  ( .a(stage2_sum[9]), .b(
        stage2_carry[9]), .c(stage2_sum2[9]), .d(stage2_carry2[9]), .cin(
        stage3_cout[9]), .cout(stage3_cout[10]), .sum(out_sumRow[9]), .carry(
        out_carryRow[10]) );
  compressor4_2_22 \stage3_42compressor[10].S3_42C  ( .a(stage2_sum[10]), .b(
        stage2_carry[10]), .c(stage2_sum2[10]), .d(stage2_carry2[10]), .cin(
        stage3_cout[10]), .cout(stage3_cout[11]), .sum(out_sumRow[10]), 
        .carry(out_carryRow[11]) );
  compressor4_2_21 \stage3_42compressor[11].S3_42C  ( .a(stage2_sum[11]), .b(
        stage2_carry[11]), .c(stage2_sum2[11]), .d(stage2_carry2[11]), .cin(
        stage3_cout[11]), .cout(stage3_cout[12]), .sum(out_sumRow[11]), 
        .carry(out_carryRow[12]) );
  compressor4_2_20 \stage3_42compressor[12].S3_42C  ( .a(stage2_sum[12]), .b(
        stage2_carry[12]), .c(stage2_sum2[12]), .d(stage2_carry2[12]), .cin(
        stage3_cout[12]), .cout(stage3_cout[13]), .sum(out_sumRow[12]), 
        .carry(out_carryRow[13]) );
  compressor4_2_19 \stage3_42compressor[13].S3_42C  ( .a(stage2_sum[13]), .b(
        stage2_carry[13]), .c(stage2_sum2[13]), .d(stage2_carry2[13]), .cin(
        stage3_cout[13]), .cout(stage3_cout[14]), .sum(out_sumRow[13]), 
        .carry(out_carryRow[14]) );
  compressor4_2_18 \stage3_42compressor[14].S3_42C  ( .a(stage2_sum[14]), .b(
        stage2_carry[14]), .c(stage2_sum2[14]), .d(stage2_carry2[14]), .cin(
        stage3_cout[14]), .cout(stage3_cout[15]), .sum(out_sumRow[14]), 
        .carry(out_carryRow[15]) );
  compressor4_2_17 \stage3_42compressor[15].S3_42C  ( .a(stage2_sum[15]), .b(
        stage2_carry[15]), .c(stage2_sum2[15]), .d(stage2_carry2[15]), .cin(
        stage3_cout[15]), .cout(stage3_cout[16]), .sum(out_sumRow[15]), 
        .carry(out_carryRow[16]) );
  compressor4_2_16 \stage3_42compressor[16].S3_42C  ( .a(stage2_sum[16]), .b(
        stage2_carry[16]), .c(stage2_sum2[16]), .d(stage2_carry2[16]), .cin(
        stage3_cout[16]), .cout(stage3_cout[17]), .sum(out_sumRow[16]), 
        .carry(out_carryRow[17]) );
  compressor4_2_15 \stage3_42compressor[17].S3_42C  ( .a(stage2_sum[17]), .b(
        stage2_carry[17]), .c(stage2_sum2[17]), .d(stage2_carry2[17]), .cin(
        stage3_cout[17]), .cout(stage3_cout[18]), .sum(out_sumRow[17]), 
        .carry(out_carryRow[18]) );
  compressor4_2_14 \stage3_42compressor[18].S3_42C  ( .a(stage2_sum[18]), .b(
        stage2_carry[18]), .c(stage2_sum2[18]), .d(stage2_carry2[18]), .cin(
        stage3_cout[18]), .cout(stage3_cout[19]), .sum(out_sumRow[18]), 
        .carry(out_carryRow[19]) );
  compressor4_2_13 \stage3_42compressor[19].S3_42C  ( .a(stage2_sum[19]), .b(
        stage2_carry[19]), .c(stage2_sum2[19]), .d(stage2_carry2[19]), .cin(
        stage3_cout[19]), .cout(stage3_cout[20]), .sum(out_sumRow[19]), 
        .carry(out_carryRow[20]) );
  compressor4_2_12 \stage3_42compressor[20].S3_42C  ( .a(stage2_sum[20]), .b(
        stage2_carry[20]), .c(stage2_sum2[20]), .d(stage2_carry2[20]), .cin(
        stage3_cout[20]), .cout(stage3_cout[21]), .sum(out_sumRow[20]), 
        .carry(out_carryRow[21]) );
  compressor4_2_11 \stage3_42compressor[21].S3_42C  ( .a(stage2_sum[21]), .b(
        stage2_carry[21]), .c(stage2_sum2[21]), .d(stage2_carry2[21]), .cin(
        stage3_cout[21]), .cout(stage3_cout[22]), .sum(out_sumRow[21]), 
        .carry(out_carryRow[22]) );
  compressor4_2_10 \stage3_42compressor[22].S3_42C  ( .a(stage2_sum[22]), .b(
        stage2_carry[22]), .c(stage2_sum2[22]), .d(stage2_carry2[22]), .cin(
        stage3_cout[22]), .cout(stage3_cout[23]), .sum(out_sumRow[22]), 
        .carry(out_carryRow[23]) );
  compressor4_2_9 \stage3_42compressor[23].S3_42C  ( .a(stage2_sum[23]), .b(
        stage2_carry[23]), .c(stage2_sum2[23]), .d(stage2_carry2[23]), .cin(
        stage3_cout[23]), .cout(stage3_cout[24]), .sum(out_sumRow[23]), 
        .carry(out_carryRow[24]) );
  compressor4_2_8 \stage3_42compressor[24].S3_42C  ( .a(stage2_sum[24]), .b(
        stage2_carry[24]), .c(stage2_sum2[24]), .d(stage2_carry2[24]), .cin(
        stage3_cout[24]), .cout(stage3_cout[25]), .sum(out_sumRow[24]), 
        .carry(out_carryRow[25]) );
  compressor4_2_7 \stage3_42compressor[25].S3_42C  ( .a(stage2_sum[25]), .b(
        stage2_carry[25]), .c(stage2_sum2[25]), .d(stage2_carry2[25]), .cin(
        stage3_cout[25]), .cout(stage3_cout[26]), .sum(out_sumRow[25]), 
        .carry(out_carryRow[26]) );
  compressor4_2_6 \stage3_42compressor[26].S3_42C  ( .a(stage2_sum[26]), .b(
        stage2_carry[26]), .c(stage2_sum2[26]), .d(stage2_carry2[26]), .cin(
        stage3_cout[26]), .cout(stage3_cout[27]), .sum(out_sumRow[26]), 
        .carry(out_carryRow[27]) );
  compressor4_2_5 \stage3_42compressor[27].S3_42C  ( .a(stage2_sum[27]), .b(
        stage2_carry[27]), .c(stage2_sum2[27]), .d(stage2_carry2[27]), .cin(
        stage3_cout[27]), .cout(stage3_cout[28]), .sum(out_sumRow[27]), 
        .carry(out_carryRow[28]) );
  compressor4_2_4 \stage3_42compressor[28].S3_42C  ( .a(stage2_sum[28]), .b(
        stage2_carry[28]), .c(stage2_sum2[28]), .d(stage2_carry2[28]), .cin(
        stage3_cout[28]), .cout(stage3_cout[29]), .sum(out_sumRow[28]), 
        .carry(out_carryRow[29]) );
  compressor4_2_3 \stage3_42compressor[29].S3_42C  ( .a(stage2_sum[29]), .b(
        stage2_carry[29]), .c(stage2_carry2[29]), .d(in_carryRow[29]), .cin(
        stage3_cout[29]), .cout(stage3_cout[30]), .sum(out_sumRow[29]), 
        .carry(out_carryRow[30]) );
  compressor4_2_2 \stage3_42compressor[30].S3_42C  ( .a(stage2_sum[30]), .b(
        stage2_carry[30]), .c(stage2_cout[30]), .d(in_carryRow[30]), .cin(
        stage3_cout[30]), .cout(stage3_cout[31]), .sum(out_sumRow[30]), 
        .carry(out_carryRow[31]) );
  compressor4_2_1 \stage3_42compressor[31].S3_42C  ( .a(1'b1), .b(
        in_sumRow[31]), .c(in_carryRow[31]), .d(stage2_carry[31]), .cin(
        stage3_cout[31]), .cout(stage3_cout[32]), .sum(out_sumRow[31]), 
        .carry(out_carryRow[32]) );
  full_adder_1 S3_FA1 ( .a(in_sumRow[32]), .b(in_carryRow[32]), .cin(
        stage3_cout[32]), .sum(out_sumRow[32]) );
endmodule


module blue_cell_0 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n2;

  INVX1 U1 ( .A(n2), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n2) );
endmodule


module black_cell_0 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n2;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n2), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n2) );
endmodule


module black_cell_1 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_2 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_3 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_4 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_5 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_6 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_7 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_8 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AOI21X1 U1 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U3 ( .A(n1), .Y(G) );
endmodule


module black_cell_9 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_10 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_11 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_12 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_13 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_14 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_15 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_16 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_17 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U3 ( .A(p2), .B(p1), .Y(P) );
endmodule


module black_cell_18 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_19 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_20 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_21 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_22 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AND2X2 U2 ( .A(p2), .B(p1), .Y(P) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_23 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_24 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_25 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_26 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_27 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_28 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_29 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_30 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_31 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
  AND2X2 U3 ( .A(p2), .B(p1), .Y(P) );
endmodule


module black_cell_32 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_33 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_34 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_35 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_36 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_37 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_38 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_39 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_40 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_41 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_42 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_43 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_44 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_45 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_46 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_47 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module black_cell_48 ( p1, p2, g1, g2, G, P );
  input p1, p2, g1, g2;
  output G, P;
  wire   n1;

  AND2X2 U1 ( .A(p2), .B(p1), .Y(P) );
  INVX1 U2 ( .A(n1), .Y(G) );
  AOI21X1 U3 ( .A0(g1), .A1(p2), .B0(g2), .Y(n1) );
endmodule


module blue_cell_1 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_2 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_3 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_4 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_5 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_6 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_7 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_8 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_9 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_10 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_11 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_12 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_13 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_14 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_15 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_16 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_17 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_18 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_19 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_20 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_21 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_22 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_23 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_24 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_25 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_26 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_27 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_28 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_29 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module blue_cell_30 ( p2, g1, g2, G );
  input p2, g1, g2;
  output G;
  wire   n1;

  INVX1 U1 ( .A(n1), .Y(G) );
  AOI21X1 U2 ( .A0(p2), .A1(g1), .B0(g2), .Y(n1) );
endmodule


module Han_Carlson ( A, B, sum, cout );
  input [31:0] A;
  input [31:0] B;
  output [31:0] sum;
  output cout;

  wire   [31:1] p;
  wire   [31:0] g;
  wire   [15:0] G1;
  wire   [15:1] P1;
  wire   [14:0] G2;
  wire   [14:1] P2;
  wire   [13:0] G3;
  wire   [13:2] P3;
  wire   [11:0] G4;
  wire   [11:4] P4;
  wire   [6:0] G5;
  wire   [14:0] G6;

  blue_cell_0 \stage1_BK[0].genblk1.blue1  ( .p2(p[1]), .g1(g[0]), .g2(g[1]), 
        .G(G1[0]) );
  black_cell_0 \stage1_BK[1].genblk1.black1  ( .p1(p[2]), .p2(p[3]), .g1(g[2]), 
        .g2(g[3]), .G(G1[1]), .P(P1[1]) );
  black_cell_48 \stage1_BK[2].genblk1.black1  ( .p1(p[4]), .p2(p[5]), .g1(g[4]), .g2(g[5]), .G(G1[2]), .P(P1[2]) );
  black_cell_47 \stage1_BK[3].genblk1.black1  ( .p1(p[6]), .p2(p[7]), .g1(g[6]), .g2(g[7]), .G(G1[3]), .P(P1[3]) );
  black_cell_46 \stage1_BK[4].genblk1.black1  ( .p1(p[8]), .p2(p[9]), .g1(g[8]), .g2(g[9]), .G(G1[4]), .P(P1[4]) );
  black_cell_45 \stage1_BK[5].genblk1.black1  ( .p1(p[10]), .p2(p[11]), .g1(
        g[10]), .g2(g[11]), .G(G1[5]), .P(P1[5]) );
  black_cell_44 \stage1_BK[6].genblk1.black1  ( .p1(p[12]), .p2(p[13]), .g1(
        g[12]), .g2(g[13]), .G(G1[6]), .P(P1[6]) );
  black_cell_43 \stage1_BK[7].genblk1.black1  ( .p1(p[14]), .p2(p[15]), .g1(
        g[14]), .g2(g[15]), .G(G1[7]), .P(P1[7]) );
  black_cell_42 \stage1_BK[8].genblk1.black1  ( .p1(p[16]), .p2(p[17]), .g1(
        g[16]), .g2(g[17]), .G(G1[8]), .P(P1[8]) );
  black_cell_41 \stage1_BK[9].genblk1.black1  ( .p1(p[18]), .p2(p[19]), .g1(
        g[18]), .g2(g[19]), .G(G1[9]), .P(P1[9]) );
  black_cell_40 \stage1_BK[10].genblk1.black1  ( .p1(p[20]), .p2(p[21]), .g1(
        g[20]), .g2(g[21]), .G(G1[10]), .P(P1[10]) );
  black_cell_39 \stage1_BK[11].genblk1.black1  ( .p1(p[22]), .p2(p[23]), .g1(
        g[22]), .g2(g[23]), .G(G1[11]), .P(P1[11]) );
  black_cell_38 \stage1_BK[12].genblk1.black1  ( .p1(p[24]), .p2(p[25]), .g1(
        g[24]), .g2(g[25]), .G(G1[12]), .P(P1[12]) );
  black_cell_37 \stage1_BK[13].genblk1.black1  ( .p1(p[26]), .p2(p[27]), .g1(
        g[26]), .g2(g[27]), .G(G1[13]), .P(P1[13]) );
  black_cell_36 \stage1_BK[14].genblk1.black1  ( .p1(p[28]), .p2(p[29]), .g1(
        g[28]), .g2(g[29]), .G(G1[14]), .P(P1[14]) );
  black_cell_35 \stage1_BK[15].genblk1.black1  ( .p1(p[30]), .p2(p[31]), .g1(
        g[30]), .g2(g[31]), .G(G1[15]), .P(P1[15]) );
  blue_cell_30 \stage2_KS[0].genblk1.blue2  ( .p2(P1[1]), .g1(G1[0]), .g2(
        G1[1]), .G(G2[0]) );
  black_cell_34 \stage2_KS[1].genblk1.black2  ( .p1(P1[1]), .p2(P1[2]), .g1(
        G1[1]), .g2(G1[2]), .G(G2[1]), .P(P2[1]) );
  black_cell_33 \stage2_KS[2].genblk1.black2  ( .p1(P1[2]), .p2(P1[3]), .g1(
        G1[2]), .g2(G1[3]), .G(G2[2]), .P(P2[2]) );
  black_cell_32 \stage2_KS[3].genblk1.black2  ( .p1(P1[3]), .p2(P1[4]), .g1(
        G1[3]), .g2(G1[4]), .G(G2[3]), .P(P2[3]) );
  black_cell_31 \stage2_KS[4].genblk1.black2  ( .p1(P1[4]), .p2(P1[5]), .g1(
        G1[4]), .g2(G1[5]), .G(G2[4]), .P(P2[4]) );
  black_cell_30 \stage2_KS[5].genblk1.black2  ( .p1(P1[5]), .p2(P1[6]), .g1(
        G1[5]), .g2(G1[6]), .G(G2[5]), .P(P2[5]) );
  black_cell_29 \stage2_KS[6].genblk1.black2  ( .p1(P1[6]), .p2(P1[7]), .g1(
        G1[6]), .g2(G1[7]), .G(G2[6]), .P(P2[6]) );
  black_cell_28 \stage2_KS[7].genblk1.black2  ( .p1(P1[7]), .p2(P1[8]), .g1(
        G1[7]), .g2(G1[8]), .G(G2[7]), .P(P2[7]) );
  black_cell_27 \stage2_KS[8].genblk1.black2  ( .p1(P1[8]), .p2(P1[9]), .g1(
        G1[8]), .g2(G1[9]), .G(G2[8]), .P(P2[8]) );
  black_cell_26 \stage2_KS[9].genblk1.black2  ( .p1(P1[9]), .p2(P1[10]), .g1(
        G1[9]), .g2(G1[10]), .G(G2[9]), .P(P2[9]) );
  black_cell_25 \stage2_KS[10].genblk1.black2  ( .p1(P1[10]), .p2(P1[11]), 
        .g1(G1[10]), .g2(G1[11]), .G(G2[10]), .P(P2[10]) );
  black_cell_24 \stage2_KS[11].genblk1.black2  ( .p1(P1[11]), .p2(P1[12]), 
        .g1(G1[11]), .g2(G1[12]), .G(G2[11]), .P(P2[11]) );
  black_cell_23 \stage2_KS[12].genblk1.black2  ( .p1(P1[12]), .p2(P1[13]), 
        .g1(G1[12]), .g2(G1[13]), .G(G2[12]), .P(P2[12]) );
  black_cell_22 \stage2_KS[13].genblk1.black2  ( .p1(P1[13]), .p2(P1[14]), 
        .g1(G1[13]), .g2(G1[14]), .G(G2[13]), .P(P2[13]) );
  black_cell_21 \stage2_KS[14].genblk1.black2  ( .p1(P1[14]), .p2(P1[15]), 
        .g1(G1[14]), .g2(G1[15]), .G(G2[14]), .P(P2[14]) );
  blue_cell_29 \stage3_KS[0].genblk1.blue31  ( .p2(P2[1]), .g1(G1[0]), .g2(
        G2[1]), .G(G3[0]) );
  blue_cell_28 \stage3_KS[1].genblk1.blue32  ( .p2(P2[2]), .g1(G2[0]), .g2(
        G2[2]), .G(G3[1]) );
  black_cell_20 \stage3_KS[2].genblk1.black3  ( .p1(P2[1]), .p2(P2[3]), .g1(
        G2[1]), .g2(G2[3]), .G(G3[2]), .P(P3[2]) );
  black_cell_19 \stage3_KS[3].genblk1.black3  ( .p1(P2[2]), .p2(P2[4]), .g1(
        G2[2]), .g2(G2[4]), .G(G3[3]), .P(P3[3]) );
  black_cell_18 \stage3_KS[4].genblk1.black3  ( .p1(P2[3]), .p2(P2[5]), .g1(
        G2[3]), .g2(G2[5]), .G(G3[4]), .P(P3[4]) );
  black_cell_17 \stage3_KS[5].genblk1.black3  ( .p1(P2[4]), .p2(P2[6]), .g1(
        G2[4]), .g2(G2[6]), .G(G3[5]), .P(P3[5]) );
  black_cell_16 \stage3_KS[6].genblk1.black3  ( .p1(P2[5]), .p2(P2[7]), .g1(
        G2[5]), .g2(G2[7]), .G(G3[6]), .P(P3[6]) );
  black_cell_15 \stage3_KS[7].genblk1.black3  ( .p1(P2[6]), .p2(P2[8]), .g1(
        G2[6]), .g2(G2[8]), .G(G3[7]), .P(P3[7]) );
  black_cell_14 \stage3_KS[8].genblk1.black3  ( .p1(P2[7]), .p2(P2[9]), .g1(
        G2[7]), .g2(G2[9]), .G(G3[8]), .P(P3[8]) );
  black_cell_13 \stage3_KS[9].genblk1.black3  ( .p1(P2[8]), .p2(P2[10]), .g1(
        G2[8]), .g2(G2[10]), .G(G3[9]), .P(P3[9]) );
  black_cell_12 \stage3_KS[10].genblk1.black3  ( .p1(P2[9]), .p2(P2[11]), .g1(
        G2[9]), .g2(G2[11]), .G(G3[10]), .P(P3[10]) );
  black_cell_11 \stage3_KS[11].genblk1.black3  ( .p1(P2[10]), .p2(P2[12]), 
        .g1(G2[10]), .g2(G2[12]), .G(G3[11]), .P(P3[11]) );
  black_cell_10 \stage3_KS[12].genblk1.black3  ( .p1(P2[11]), .p2(P2[13]), 
        .g1(G2[11]), .g2(G2[13]), .G(G3[12]), .P(P3[12]) );
  black_cell_9 \stage3_KS[13].genblk1.black3  ( .p1(P2[12]), .p2(P2[14]), .g1(
        G2[12]), .g2(G2[14]), .G(G3[13]), .P(P3[13]) );
  blue_cell_27 \stage4_KS[0].genblk1.blue41  ( .p2(P3[2]), .g1(G1[0]), .g2(
        G3[2]), .G(G4[0]) );
  blue_cell_26 \stage4_KS[1].genblk1.blue42  ( .p2(P3[3]), .g1(G2[0]), .g2(
        G3[3]), .G(G4[1]) );
  blue_cell_25 \stage4_KS[2].genblk1.blue43  ( .p2(P3[4]), .g1(G3[0]), .g2(
        G3[4]), .G(G4[2]) );
  blue_cell_24 \stage4_KS[3].genblk1.blue43  ( .p2(P3[5]), .g1(G3[1]), .g2(
        G3[5]), .G(G4[3]) );
  black_cell_8 \stage4_KS[4].genblk1.black4  ( .p1(P3[2]), .p2(P3[6]), .g1(
        G3[2]), .g2(G3[6]), .G(G4[4]), .P(P4[4]) );
  black_cell_7 \stage4_KS[5].genblk1.black4  ( .p1(P3[3]), .p2(P3[7]), .g1(
        G3[3]), .g2(G3[7]), .G(G4[5]), .P(P4[5]) );
  black_cell_6 \stage4_KS[6].genblk1.black4  ( .p1(P3[4]), .p2(P3[8]), .g1(
        G3[4]), .g2(G3[8]), .G(G4[6]), .P(P4[6]) );
  black_cell_5 \stage4_KS[7].genblk1.black4  ( .p1(P3[5]), .p2(P3[9]), .g1(
        G3[5]), .g2(G3[9]), .G(G4[7]), .P(P4[7]) );
  black_cell_4 \stage4_KS[8].genblk1.black4  ( .p1(P3[6]), .p2(P3[10]), .g1(
        G3[6]), .g2(G3[10]), .G(G4[8]), .P(P4[8]) );
  black_cell_3 \stage4_KS[9].genblk1.black4  ( .p1(P3[7]), .p2(P3[11]), .g1(
        G3[7]), .g2(G3[11]), .G(G4[9]), .P(P4[9]) );
  black_cell_2 \stage4_KS[10].genblk1.black4  ( .p1(P3[8]), .p2(P3[12]), .g1(
        G3[8]), .g2(G3[12]), .G(G4[10]), .P(P4[10]) );
  black_cell_1 \stage4_KS[11].genblk1.black4  ( .p1(P3[9]), .p2(P3[13]), .g1(
        G3[9]), .g2(G3[13]), .G(G4[11]), .P(P4[11]) );
  blue_cell_23 \stage5_KS[0].genblk1.blue51  ( .p2(P4[4]), .g1(G1[0]), .g2(
        G4[4]), .G(G5[0]) );
  blue_cell_22 \stage5_KS[1].genblk1.blue52  ( .p2(P4[5]), .g1(G2[0]), .g2(
        G4[5]), .G(G5[1]) );
  blue_cell_21 \stage5_KS[2].genblk1.blue53  ( .p2(P4[6]), .g1(G3[0]), .g2(
        G4[6]), .G(G5[2]) );
  blue_cell_20 \stage5_KS[3].genblk1.blue53  ( .p2(P4[7]), .g1(G3[1]), .g2(
        G4[7]), .G(G5[3]) );
  blue_cell_19 \stage5_KS[4].genblk1.blue54  ( .p2(P4[8]), .g1(G4[0]), .g2(
        G4[8]), .G(G5[4]) );
  blue_cell_18 \stage5_KS[5].genblk1.blue54  ( .p2(P4[9]), .g1(G4[1]), .g2(
        G4[9]), .G(G5[5]) );
  blue_cell_17 \stage5_KS[6].genblk1.blue54  ( .p2(P4[10]), .g1(G4[2]), .g2(
        G4[10]), .G(G5[6]) );
  blue_cell_16 \stage5_KS[7].genblk1.blue54  ( .p2(P4[11]), .g1(G4[3]), .g2(
        G4[11]), .G(cout) );
  blue_cell_15 b60 ( .p2(p[2]), .g1(G1[0]), .g2(g[2]), .G(G6[0]) );
  blue_cell_14 b61 ( .p2(p[4]), .g1(G2[0]), .g2(g[4]), .G(G6[1]) );
  blue_cell_13 b62 ( .p2(p[6]), .g1(G3[0]), .g2(g[6]), .G(G6[2]) );
  blue_cell_12 b63 ( .p2(p[8]), .g1(G3[1]), .g2(g[8]), .G(G6[3]) );
  blue_cell_11 b64 ( .p2(p[10]), .g1(G4[0]), .g2(g[10]), .G(G6[4]) );
  blue_cell_10 b65 ( .p2(p[12]), .g1(G4[1]), .g2(g[12]), .G(G6[5]) );
  blue_cell_9 b66 ( .p2(p[14]), .g1(G4[2]), .g2(g[14]), .G(G6[6]) );
  blue_cell_8 b67 ( .p2(p[16]), .g1(G4[3]), .g2(g[16]), .G(G6[7]) );
  blue_cell_7 b68 ( .p2(p[18]), .g1(G5[0]), .g2(g[18]), .G(G6[8]) );
  blue_cell_6 b69 ( .p2(p[20]), .g1(G5[1]), .g2(g[20]), .G(G6[9]) );
  blue_cell_5 b610 ( .p2(p[22]), .g1(G5[2]), .g2(g[22]), .G(G6[10]) );
  blue_cell_4 b611 ( .p2(p[24]), .g1(G5[3]), .g2(g[24]), .G(G6[11]) );
  blue_cell_3 b612 ( .p2(p[26]), .g1(G5[4]), .g2(g[26]), .G(G6[12]) );
  blue_cell_2 b613 ( .p2(p[28]), .g1(G5[5]), .g2(g[28]), .G(G6[13]) );
  blue_cell_1 b614 ( .p2(p[30]), .g1(G5[6]), .g2(g[30]), .G(G6[14]) );
  XOR2X1 U1 ( .A(G4[2]), .B(p[14]), .Y(sum[14]) );
  XOR2X1 U2 ( .A(G4[3]), .B(p[16]), .Y(sum[16]) );
  XOR2X1 U3 ( .A(G5[0]), .B(p[18]), .Y(sum[18]) );
  XOR2X1 U4 ( .A(G5[1]), .B(p[20]), .Y(sum[20]) );
  XOR2X1 U5 ( .A(G5[2]), .B(p[22]), .Y(sum[22]) );
  XOR2X1 U6 ( .A(G5[3]), .B(p[24]), .Y(sum[24]) );
  XOR2X1 U7 ( .A(G5[4]), .B(p[26]), .Y(sum[26]) );
  XOR2X1 U8 ( .A(G5[5]), .B(p[28]), .Y(sum[28]) );
  XOR2X1 U9 ( .A(G6[6]), .B(p[15]), .Y(sum[15]) );
  XOR2X1 U10 ( .A(G6[7]), .B(p[17]), .Y(sum[17]) );
  XOR2X1 U11 ( .A(G6[8]), .B(p[19]), .Y(sum[19]) );
  XOR2X1 U12 ( .A(G6[9]), .B(p[21]), .Y(sum[21]) );
  XOR2X1 U13 ( .A(G6[10]), .B(p[23]), .Y(sum[23]) );
  XOR2X1 U14 ( .A(G6[11]), .B(p[25]), .Y(sum[25]) );
  XOR2X1 U15 ( .A(G6[12]), .B(p[27]), .Y(sum[27]) );
  XOR2X1 U16 ( .A(G4[0]), .B(p[10]), .Y(sum[10]) );
  XOR2X1 U17 ( .A(G4[1]), .B(p[12]), .Y(sum[12]) );
  XOR2X1 U18 ( .A(G6[4]), .B(p[11]), .Y(sum[11]) );
  XOR2X1 U19 ( .A(G6[5]), .B(p[13]), .Y(sum[13]) );
  XOR2X1 U20 ( .A(A[26]), .B(B[26]), .Y(p[26]) );
  XOR2X1 U21 ( .A(A[10]), .B(B[10]), .Y(p[10]) );
  XOR2X1 U22 ( .A(A[14]), .B(B[14]), .Y(p[14]) );
  XOR2X1 U23 ( .A(A[12]), .B(B[12]), .Y(p[12]) );
  XOR2X1 U24 ( .A(A[16]), .B(B[16]), .Y(p[16]) );
  XOR2X1 U25 ( .A(A[24]), .B(B[24]), .Y(p[24]) );
  XOR2X1 U26 ( .A(A[18]), .B(B[18]), .Y(p[18]) );
  XOR2X1 U27 ( .A(A[22]), .B(B[22]), .Y(p[22]) );
  XOR2X1 U28 ( .A(A[20]), .B(B[20]), .Y(p[20]) );
  XOR2X1 U29 ( .A(A[11]), .B(B[11]), .Y(p[11]) );
  XOR2X1 U30 ( .A(A[15]), .B(B[15]), .Y(p[15]) );
  XOR2X1 U31 ( .A(A[13]), .B(B[13]), .Y(p[13]) );
  XOR2X1 U32 ( .A(A[17]), .B(B[17]), .Y(p[17]) );
  XOR2X1 U33 ( .A(A[25]), .B(B[25]), .Y(p[25]) );
  XOR2X1 U34 ( .A(A[19]), .B(B[19]), .Y(p[19]) );
  XOR2X1 U35 ( .A(A[23]), .B(B[23]), .Y(p[23]) );
  XOR2X1 U36 ( .A(A[21]), .B(B[21]), .Y(p[21]) );
  XOR2X1 U37 ( .A(A[9]), .B(B[9]), .Y(p[9]) );
  AND2X2 U38 ( .A(B[12]), .B(A[12]), .Y(g[12]) );
  AND2X2 U39 ( .A(B[16]), .B(A[16]), .Y(g[16]) );
  AND2X2 U40 ( .A(B[14]), .B(A[14]), .Y(g[14]) );
  AND2X2 U41 ( .A(B[18]), .B(A[18]), .Y(g[18]) );
  AND2X2 U42 ( .A(B[20]), .B(A[20]), .Y(g[20]) );
  AND2X2 U43 ( .A(B[22]), .B(A[22]), .Y(g[22]) );
  AND2X2 U44 ( .A(B[24]), .B(A[24]), .Y(g[24]) );
  AND2X2 U45 ( .A(B[10]), .B(A[10]), .Y(g[10]) );
  AND2X2 U46 ( .A(B[9]), .B(A[9]), .Y(g[9]) );
  AND2X2 U47 ( .A(B[11]), .B(A[11]), .Y(g[11]) );
  AND2X2 U48 ( .A(B[13]), .B(A[13]), .Y(g[13]) );
  AND2X2 U49 ( .A(B[17]), .B(A[17]), .Y(g[17]) );
  AND2X2 U50 ( .A(B[15]), .B(A[15]), .Y(g[15]) );
  AND2X2 U51 ( .A(B[19]), .B(A[19]), .Y(g[19]) );
  AND2X2 U52 ( .A(B[21]), .B(A[21]), .Y(g[21]) );
  AND2X2 U53 ( .A(B[23]), .B(A[23]), .Y(g[23]) );
  AND2X2 U54 ( .A(B[25]), .B(A[25]), .Y(g[25]) );
  XOR2X1 U55 ( .A(G5[6]), .B(p[30]), .Y(sum[30]) );
  XOR2X1 U56 ( .A(G6[13]), .B(p[29]), .Y(sum[29]) );
  XOR2X1 U57 ( .A(G6[14]), .B(p[31]), .Y(sum[31]) );
  XOR2X1 U58 ( .A(A[28]), .B(B[28]), .Y(p[28]) );
  XOR2X1 U59 ( .A(A[27]), .B(B[27]), .Y(p[27]) );
  AND2X2 U60 ( .A(B[26]), .B(A[26]), .Y(g[26]) );
  AND2X2 U61 ( .A(B[28]), .B(A[28]), .Y(g[28]) );
  AND2X2 U62 ( .A(B[27]), .B(A[27]), .Y(g[27]) );
  XOR2X1 U63 ( .A(G6[2]), .B(p[7]), .Y(sum[7]) );
  XOR2X1 U64 ( .A(G3[0]), .B(p[6]), .Y(sum[6]) );
  XOR2X1 U65 ( .A(G3[1]), .B(p[8]), .Y(sum[8]) );
  XOR2X1 U66 ( .A(G6[3]), .B(p[9]), .Y(sum[9]) );
  XOR2X1 U67 ( .A(G2[0]), .B(p[4]), .Y(sum[4]) );
  XOR2X1 U68 ( .A(G6[1]), .B(p[5]), .Y(sum[5]) );
  XOR2X1 U69 ( .A(G6[0]), .B(p[3]), .Y(sum[3]) );
  XOR2X1 U70 ( .A(G1[0]), .B(p[2]), .Y(sum[2]) );
  XOR2X1 U71 ( .A(A[8]), .B(B[8]), .Y(p[8]) );
  XOR2X1 U72 ( .A(A[6]), .B(B[6]), .Y(p[6]) );
  XOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(p[5]) );
  XOR2X1 U74 ( .A(A[7]), .B(B[7]), .Y(p[7]) );
  AND2X2 U75 ( .A(B[6]), .B(A[6]), .Y(g[6]) );
  AND2X2 U76 ( .A(B[8]), .B(A[8]), .Y(g[8]) );
  AND2X2 U77 ( .A(B[5]), .B(A[5]), .Y(g[5]) );
  AND2X2 U78 ( .A(B[7]), .B(A[7]), .Y(g[7]) );
  XOR2X1 U79 ( .A(A[4]), .B(B[4]), .Y(p[4]) );
  XOR2X1 U80 ( .A(A[29]), .B(B[29]), .Y(p[29]) );
  AND2X2 U81 ( .A(B[4]), .B(A[4]), .Y(g[4]) );
  AND2X2 U82 ( .A(B[29]), .B(A[29]), .Y(g[29]) );
  AND2X2 U83 ( .A(B[3]), .B(A[3]), .Y(g[3]) );
  XOR2X1 U84 ( .A(A[30]), .B(B[30]), .Y(p[30]) );
  XOR2X1 U85 ( .A(A[31]), .B(B[31]), .Y(p[31]) );
  AND2X2 U86 ( .A(B[30]), .B(A[30]), .Y(g[30]) );
  XOR2X1 U87 ( .A(A[2]), .B(B[2]), .Y(p[2]) );
  XOR2X1 U88 ( .A(A[3]), .B(B[3]), .Y(p[3]) );
  XOR2X1 U89 ( .A(A[1]), .B(B[1]), .Y(p[1]) );
  XOR2X1 U90 ( .A(g[0]), .B(p[1]), .Y(sum[1]) );
  AND2X2 U91 ( .A(B[1]), .B(A[1]), .Y(g[1]) );
  AND2X2 U92 ( .A(B[2]), .B(A[2]), .Y(g[2]) );
  AND2X2 U93 ( .A(B[31]), .B(A[31]), .Y(g[31]) );
  XOR2X1 U94 ( .A(B[0]), .B(A[0]), .Y(sum[0]) );
  AND2X2 U95 ( .A(B[0]), .B(A[0]), .Y(g[0]) );
endmodule


module Mul_syn (A, B, product );
  input [15:0] A;
  input [15:0] B;
  output [31:0] product;
  //input clk;

  wire   [16:0] row0;
  wire   [16:0] row1;
  wire   [16:0] row2;
  wire   [16:0] row3;
  wire   [16:0] row4;
  wire   [16:0] row5;
  wire   [16:0] row6;
  wire   [16:0] row7;
  wire   [7:0] add;
  wire   [32:0] OS;
  wire   [32:1] OC;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  Booth_multiplier BM ( .X(A), .Y(B), .row0(row0), .row1(row1), .row2(row2), 
        .row3(row3), .row4(row4), .row5(row5), .row6(row6), .row7(row7), .add(
        add) );
  Dadda DADDA ( .row0(row0), .row1(row1), .row2(row2), .row3(row3), .row4(row4), .row5(row5), .row6(row6), .row7(row7), .add(add), .in_sumRow({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .in_carryRow({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .out_sumRow({
        SYNOPSYS_UNCONNECTED__0, OS[31:0]}), .out_carryRow({
        SYNOPSYS_UNCONNECTED__1, OC[31:1]}) );
  Han_Carlson HCA ( .A(OS[31:0]), .B({OC[31:1], 1'b0}), .sum(product) );
endmodule

