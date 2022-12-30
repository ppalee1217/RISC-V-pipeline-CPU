//`include "Booth_encoder.v"
//`include "Booth_decoder.v"
//`include "complement.v"
//`include "row_LSB.v"

module Booth_multiplier(X, Y, 
                        row0, row1, row2, row3, row4, row5, row6, row7,
                        add
			);

parameter BITWIDTH = 16;

input  [BITWIDTH-1:0]   X; // multiplicand 16 bit
input  [BITWIDTH-1:0]   Y; // multiplier   16 bit

output reg [BITWIDTH:0]     row0;
output reg [BITWIDTH:0]     row1;
output reg [BITWIDTH:0]     row2;
output reg [BITWIDTH:0]     row3;
output reg [BITWIDTH:0]     row4;
output reg [BITWIDTH:0]     row5;
output reg [BITWIDTH:0]     row6;
output reg [BITWIDTH:0]     row7;
output reg [BITWIDTH/2-1:0] add;
//output [2*BITWIDTH-1:0] product; // 32bit

//reg    [BITWIDTH-1:0] constant = 16'b1010_1010_1010_1011; // last row of partial product
//wire   [BITWIDTH:0]     x_add0; // add 0 to multiplicand 17 bit
reg   [BITWIDTH:0]     y_add0; // add 0 to multiplier 17 bit

reg   [BITWIDTH/2-1:0] neg; // 8 bit
reg   [BITWIDTH/2-1:0] x1;  // 8 bit
reg   [BITWIDTH/2-1:0] x2p; // 8 bit
reg   [BITWIDTH/2-1:0] zp;  // 8 bit
//wire   [BITWIDTH/2-1:0] add; // 8 bit

reg   row [BITWIDTH/2-1:0][BITWIDTH:0]; // one row of partial product 17bit
reg   [BITWIDTH:0] pp [0:BITWIDTH/2-1]; //8 row, 17bit



integer i, j, k;
always @(*) begin
	// add zero to Y lsb
	y_add0 = {Y, 1'b0};
	
	// booth encoding
	for(i=0; i<BITWIDTH/2; i=i+1) begin : Booth_Encoder_Loop
		neg[i] = y_add0[2*i+2];
		x1[i]  =y_add0[2*i] ~^ y_add0[2*i+1];
		zp[i] = y_add0[2*i+1] ~^ y_add0[2*i+2];
		x2p[i] = y_add0[2*i] ^ y_add0[2*i+1];
	end


	// booth decoding
	for(j=0; j<BITWIDTH/2; j=j+1) begin: Booth_Decoder_Row
		//decoding row lsb
		row[j][0] = X[0] & (y_add0[2*j] ^ y_add0[2*j+1]);
		
		//decoding add bit
		add[j] = y_add0[2*j+2] & ~((y_add0[2*j]&y_add0[2*j+1]) | (y_add0[2*j]&X[0]) | (y_add0[2*j+1]&X[0]));
		
		// produce sign bit in row
		row[j][BITWIDTH] = ~(neg[j]^X[BITWIDTH-1]) | (x1[j]&zp[j]); //importance!!  MSB of pp row
		
		// produce partial product
		for(k=1; k<BITWIDTH; k=k+1) begin : Booth_Decoder_Bit
			row[j][k] = ~(((X[k]~^neg[j]) | x1[j]) & ((X[k-1]~^neg[j]) | zp[j] | x2p[j]));
		end
		
		// assign one row of pp
		pp[j] = {
			row[j][16],row[j][15],row[j][14],row[j][13],row[j][12],row[j][11],
			row[j][10],row[j][9],row[j][8],row[j][7],row[j][6],row[j][5],row[j][4],row[j][3],row[j][2],row[j][1],row[j][0]
		};
	end

	// assign partial product array to row in each
	row0 = pp[0];
	row1 = pp[1];
	row2 = pp[2];
	row3 = pp[3];
	row4 = pp[4];
	row5 = pp[5];
	row6 = pp[6];
	row7 = pp[7];
end

endmodule
