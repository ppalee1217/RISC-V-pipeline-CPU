//`include "half_adder.v"
//`include "full_adder.v"
//`include "compressor4_2.v"


module Dadda(row0, row1, row2, row3, row4, row5, row6, row7, add, 
             in_sumRow, in_carryRow, out_sumRow, out_carryRow);

parameter BITWIDTH = 16;

//partial product row
input [16:0]    row0;
input [16:0]    row1;
input [16:0]    row2;
input [16:0]    row3;
input [16:0]    row4;
input [16:0]    row5;
input [16:0]    row6;
input [16:0]    row7;
input [7:0]     add;                 // 2's complement for each row
input [32:0]    in_sumRow;           // feedback row of sum
input [32:1]    in_carryRow;         // feedback row of carry

output reg [32:0]    out_sumRow;          // row of sum
output reg [32:1]    out_carryRow;        // row of carry

//reg [15:0] constant = 16'b1010_1010_1010_1011;

reg [21:13] stage1_cout;
reg [22:11] stage1_sum;
reg [18:15] stage1_sum2;
reg [23:12] stage1_carry;
reg [19:16] stage1_carry2;

reg [30:5]  stage2_cout;
reg [25:9]  stage2_cout2;
reg [30:3]  stage2_sum;
reg [28:7]  stage2_sum2;
reg [31:4]  stage2_carry;
reg [29:8]  stage2_carry2;

reg [32:1]  stage3_cout;
reg [32:0]  stage3_sum;
reg [33:1]  stage3_carry;

//---------------- stage 1  reduce 11->8 ----------------//
//reconnect input row
wire [32:0]  stage1_row0  = {in_sumRow[32], 1'b1, row7[16:15], row6[16:15], row5[16:15], row4[16:15], row3[16:15], row2[16:15], row1[16:15], row0};
wire [32:0]  stage1_row1  = {in_carryRow[32], in_sumRow[31], 2'b01, row7[14:13], row6[14:13], row5[14:13], row4[14:13], row3[14:13], row2[14:13], row1[14:0], add[0], in_sumRow[0]};
wire [31:1]  stage1_row2  = {in_carryRow[31], in_sumRow[30:29], 2'b01, row7[12:11], row6[12:11], row5[12:11], row4[12:11], row3[12:11], row2[12:0], add[1], in_sumRow[2:1]};
wire [30:1]  stage1_row3  = {in_carryRow[30:29], in_sumRow[28:27], 2'b01, row7[10:9], row6[10:9], row5[10:9], row4[10:9], row3[10:0], add[2], in_sumRow[4:3], in_carryRow[2:1]};
wire [28:3]  stage1_row4  = {in_carryRow[28:27], in_sumRow[26:25], 2'b01, row7[8:7], row6[8:7], row5[8:7], row4[8:0], add[3], in_sumRow[6:5], in_carryRow[4:3]};
wire [26:5]  stage1_row5  = {in_carryRow[26:25], in_sumRow[24:23], 2'b01, row7[6:5], row6[6:5], row5[6:0], add[4], in_sumRow[8:7], in_carryRow[6:5]};
wire [24:7]  stage1_row6  = {in_carryRow[24:23], in_sumRow[22:21], 2'b01, row7[4:3], row6[4:0], add[5], in_sumRow[10:9], in_carryRow[8:7]};
wire [22:9]  stage1_row7  = {in_carryRow[22:21], in_sumRow[20:19], 2'b01, row7[2:0], add[6], in_sumRow[12:11], in_carryRow[10:9]};
wire [20:11] stage1_row8  = {in_carryRow[20:19], in_sumRow[18:17], 1'b1, add[7], in_sumRow[14:13], in_carryRow[12:11]};
wire [18:13] stage1_row9  = {in_carryRow[18:17], in_sumRow[16:15], in_carryRow[14:13]};
wire [16:15] stage1_row10 = {in_carryRow[16:15]};

//---------------- stage 2  reduce 8->4 ----------------//
//reconnect input row
wire [32:0] stage2_row0 = {stage1_row0[32:23], stage1_sum[22:11], stage1_row0[10:0]};
wire [32:0] stage2_row1 = {stage1_row1[32:23], stage1_carry[22:12], stage1_row2[11], stage1_row1[10:0]};
wire [31:1] stage2_row2 = {stage1_row2[31:22], stage1_cout[21], stage1_row3[20:19], stage1_sum2[18:15], stage1_row4[14:13], stage1_row3[12:11], stage1_row2[10:1]};
wire [30:1] stage2_row3 = {stage1_row3[30:21], stage1_row4[20:19], stage1_carry2[18:16], stage1_row6[15], stage1_row5[14:13], stage1_row4[12], stage1_row4[11], stage1_row3[10:1]};
wire [28:3] stage2_row4 = {stage1_row4[28:21], stage1_row5[20:19], stage1_row6[18:17], stage1_row7[16], stage1_row7[15], stage1_row6[14:13], stage1_row5[12], stage1_row5[11], stage1_row4[10:3]};
wire [26:5] stage2_row5 = {stage1_row5[26:21], stage1_row6[20:19], stage1_row7[18:17], stage1_row8[16], stage1_row8[15], stage1_row7[14:13], stage1_row6[12], stage1_row6[11], stage1_row5[10:5]};
wire [24:7] stage2_row6 = {stage1_row6[24:21], stage1_row7[20:19], stage1_row8[18:17], stage1_row9[16], stage1_row9[15], stage1_row8[14:13], stage1_row7[12], stage1_row7[11], stage1_row6[10:7]};
wire [23:9] stage2_row7 = {stage1_carry[23], stage1_row7[22:21], stage1_row8[20:19], stage1_row9[18:17], stage1_row10[16], stage1_row10[15], stage1_row9[14:13], stage1_row8[12], stage1_row8[11], stage1_row7[10:9]};

//---------------- stage 3  reduce 4->2 ----------------//
//reconnect input row
wire [32:0] stage3_row0 = {stage2_row0[32:31], stage2_sum[30:3], stage2_row0[2:0]};
wire [32:0] stage3_row1 = {stage2_row1[32:31], stage2_carry[30:4], stage2_row2[3], stage2_row1[2:0]};
wire [31:1] stage3_row2 = {stage2_row2[31], stage2_cout[30], stage2_carry2[29], stage2_sum2[28:7], stage2_row4[6:5], stage2_row3[4:3], stage2_row2[2:1]};
wire [31:1] stage3_row3 = {stage2_carry[31], stage2_row3[30:29], stage2_carry2[28:8], stage2_row6[7], stage2_row5[6:5], stage2_row4[4:3], stage2_row3[2:1]};



//adder tree
integer i, j, k, m;
always @(*) begin
	//-----------------------------------------------------------------------------//
	//                                   stage 1                                   //
	//-----------------------------------------------------------------------------//
	{stage1_carry[12], stage1_sum[11]} = stage1_row0[11] + stage1_row1[11];
	{stage1_carry[13], stage1_sum[12]} = stage1_row0[12] + stage1_row1[12] + stage1_row2[12];
	stage1_cout[13] = 1'b0;

	for(i=13; i<=20; i=i+1) begin: stage1_42compressor
		if(i==19) begin
			stage1_cout[i+1] = (stage1_row0[i]&stage1_row1[i]) | (stage1_row0[i]&stage1_row2[i]) | (stage1_row1[i]&stage1_row2[i]);
			stage1_sum[i] = stage1_row0[i]^stage1_row1[i]^stage1_row2[i]^stage1_carry2[19]^stage1_cout[i];
			stage1_carry[i+1] = ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&stage1_carry2[19]) | ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&stage1_cout[i]) | (stage1_carry2[19]&stage1_cout[i]);
		end
		else if(i==20) begin
			stage1_cout[i+1] = (stage1_row0[i]&stage1_row1[i]) | (stage1_row0[i]&stage1_row2[i]) | (stage1_row1[i]&stage1_row2[i]);
			stage1_sum[i] = stage1_row0[i]^stage1_row1[i]^stage1_row2[i]^1'b0^stage1_cout[i];
			stage1_carry[i+1] = ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&1'b0) | ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&stage1_cout[i]) | (1'b0&stage1_cout[i]);
		end
		else begin
			stage1_cout[i+1] = (stage1_row0[i]&stage1_row1[i]) | (stage1_row0[i]&stage1_row2[i]) | (stage1_row1[i]&stage1_row2[i]);
			stage1_sum[i] = stage1_row0[i]^stage1_row1[i]^stage1_row2[i]^stage1_row3[i]^stage1_cout[i];
			stage1_carry[i+1] = ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&stage1_row3[i]) | ((stage1_row0[i]^stage1_row1[i]^stage1_row2[i])&stage1_cout[i]) | (stage1_row3[i]&stage1_cout[i]);
		end
	end

	{stage1_carry[22], stage1_sum[21]} = stage1_row0[21] + stage1_row1[21] + stage1_row2[21];
	{stage1_carry[23], stage1_sum[22]} = stage1_row0[22] + stage1_row1[22];
	
	//second layer in stage 1
	{stage1_carry2[16], stage1_sum2[15]} = stage1_row4[15] + stage1_row5[15];
	{stage1_carry2[17], stage1_sum2[16]} = stage1_row4[16] + stage1_row5[16] + stage1_row6[16];
	{stage1_carry2[18], stage1_sum2[17]} = stage1_row4[17] + stage1_row5[17];
	{stage1_carry2[19], stage1_sum2[18]} = stage1_row4[18] + stage1_row5[18];


	{stage2_carry[4], stage2_sum[3]} = stage2_row0[3] + stage2_row1[3];
	{stage2_carry[5], stage2_sum[4]} = stage2_row0[4] + stage2_row1[4] + stage2_row2[4];
	stage2_cout[5] = 1'b0;

	for(j=5; j<=29; j=j+1) begin: stage2_42compressor_layer1
		if(j>=27) begin
			stage2_cout[j+1] = (stage2_row0[j]&stage2_row1[j]) | (stage2_row0[j]&stage2_row2[j]) | (stage2_row1[j]&stage2_row2[j]);
			stage2_sum[j] = stage2_row0[j]^stage2_row1[j]^stage2_row2[j]^1'b0^stage2_cout[j];
			stage2_carry[j+1] = ((stage2_row0[j]^stage2_row1[j]^stage2_row2[j])&1'b0) | ((stage2_row0[j]^stage2_row1[j]^stage2_row2[j])&stage2_cout[j]) | (1'b0&stage2_cout[j]);
		end
		else begin
			stage2_cout[j+1] = (stage2_row0[j]&stage2_row1[j]) | (stage2_row0[j]&stage2_row2[j]) | (stage2_row1[j]&stage2_row2[j]);
			stage2_sum[j] = stage2_row0[j]^stage2_row1[j]^stage2_row2[j]^stage2_row3[j]^stage2_cout[j];
			stage2_carry[j+1] = ((stage2_row0[j]^stage2_row1[j]^stage2_row2[j])&stage2_row3[j]) | ((stage2_row0[j]^stage2_row1[j]^stage2_row2[j])&stage2_cout[j]) | (stage2_row3[j]&stage2_cout[j]);
		end	
	end


	//-----------------------------------------------------------------------------//
	//                                   stage 2                                   //
	//-----------------------------------------------------------------------------//
	{stage2_carry[31], stage2_sum[30]} = stage2_row0[30] + stage2_row1[30] + stage2_row2[30];

	{stage2_carry2[8], stage2_sum2[7]} = stage2_row4[7] + stage2_row5[7];
	{stage2_carry2[9], stage2_sum2[8]} = stage2_row4[8] + stage2_row5[8] + stage2_row6[8];
	stage2_cout2[9] = 1'b0;
	
	for(k=9; k<=24; k=k+1) begin: stage2_42compressor_layer2
		if(k==24) begin
			stage2_cout2[k+1] = (stage2_row4[k]&stage2_row5[k]) | (stage2_row4[k]&stage2_row6[k]) | (stage2_row5[k]&stage2_row6[k]);
			stage2_sum2[k] = stage2_row4[k]^stage2_row5[k]^stage2_row6[k]^1'b0^stage2_cout2[k];
			stage2_carry2[k+1] = ((stage2_row4[k]^stage2_row5[k]^stage2_row6[k])&1'b0) | ((stage2_row4[k]^stage2_row5[k]^stage2_row6[k])&stage2_cout2[k]) | (1'b0&stage2_cout2[k]);
		end
		else begin
			stage2_cout2[k+1] = (stage2_row4[k]&stage2_row5[k]) | (stage2_row4[k]&stage2_row6[k]) | (stage2_row5[k]&stage2_row6[k]);
			stage2_sum2[k] = stage2_row4[k]^stage2_row5[k]^stage2_row6[k]^stage2_row7[k]^stage2_cout2[k];
			stage2_carry2[k+1] = ((stage2_row4[k]^stage2_row5[k]^stage2_row6[k])&stage2_row7[k]) | ((stage2_row4[k]^stage2_row5[k]^stage2_row6[k])&stage2_cout2[k]) | (stage2_row7[k]&stage2_cout2[k]);
		end
	end

	{stage2_carry2[26], stage2_sum2[25]} = stage2_row4[25] + stage2_row5[25] + stage2_cout2[25];
	{stage2_carry2[27], stage2_sum2[26]} = stage2_row4[26] + stage2_row5[26];
	{stage2_carry2[28], stage2_sum2[27]} = stage2_row3[27] + stage2_row4[27];
	{stage2_carry2[29], stage2_sum2[28]} = stage2_row3[28] + stage2_row4[28];


	//-----------------------------------------------------------------------------//
	//                                   stage 1                                   //
	//-----------------------------------------------------------------------------//
	{stage3_carry[1],stage3_sum[0]} =  stage3_row0[0] + stage3_row1[0];
	stage3_cout[1] = 1'b0;

	for(m=1; m<=31; m=m+1) begin: stage3_42compressor
		stage3_cout[m+1] = (stage3_row0[m]&stage3_row1[m]) | (stage3_row0[m]&stage3_row2[m]) | (stage3_row1[m]&stage3_row2[m]);
		stage3_sum[m] = stage3_row0[m]^stage3_row1[m]^stage3_row2[m]^stage3_row3[m]^stage3_cout[m];
		stage3_carry[m+1] = ((stage3_row0[m]^stage3_row1[m]^stage3_row2[m])&stage3_row3[m]) | ((stage3_row0[m]^stage3_row1[m]^stage3_row2[m])&stage3_cout[m]) | (stage3_row3[m]&stage3_cout[m]);
	end

	{stage3_carry[33], stage3_sum[32]} = stage3_row0[32] + stage3_row1[32] + stage3_cout[32];
	
	
	//----------------- finiish result 2 row ------------------//
	out_sumRow = stage3_sum;
	out_carryRow = stage3_carry[32:1];
end

endmodule
