//`include "black_cell.v"
//`include "blue_cell.v"

module Han_Carlson(A, B, sum, cout);
// parameter N = 32 
input  [31:0] A, B;
output reg [31:0] sum;
output reg cout;

reg [15:0] G1;
reg [15:1] P1;
reg [14:0] G2;
reg [14:1] P2;
reg [13:0] G3;
reg [13:2] P3;
reg [11:0] G4;
reg [11:4] P4;
reg [7:0]  G5;
reg [14:0] G6;

reg [31:0] p, g, carry;


//------- carry generation -------//

integer i, j, k, m, n;
always @(*) begin
	//------- p g generation -------//
	p = A ^ B;
	g = A & B;
	
	//stage 1 BK
	for(i=0; i<16; i=i+1) begin: stage1_BK
		if(i==0) begin
			G1[i] = g[1] | (p[1]&g[0]);
		end
		else begin
			G1[i] = g[2*i+1] | (p[2*i+1]&g[2*i]);
			P1[i] = p[2*i] & p[2*i+1];
		end
	end

	//stage 2 KS
	for(j=0; j<15; j=j+1) begin: stage2_KS
		if(j==0) begin
			G2[j] = G1[j+1] | (P1[j+1]&G1[j]);
		end
		else begin
			G2[j] = G1[j+1] | (P1[j+1]&G1[j]);
			P2[j] = P1[j] & P1[j+1];
		end
	end

	//stage 3 KS
	for(k=0; k<14; k=k+1) begin: stage3_KS
		if(k==0) begin
			G3[k] = G2[k+1] | (P2[k+1]&G1[0]);
		end
		else if(k==1) begin
			G3[k] = G2[k+1] | (P2[k+1]&G2[k-1]);
		end
		else begin
			G3[k] = G2[k+1] | (P2[k+1]&G2[k-1]);
			P3[k] = P2[k-1] & P2[k+1];
		end
	end

	//stage 4 KS
	for(m=0; m<12; m=m+1) begin: stage4_KS
		if(m==0) begin
			G4[m] = G3[m+2] | (P3[m+2]&G1[0]);
		end
		else if(m==1) begin
			G4[m] = G3[m+2] | (P3[m+2]&G2[m-1]);
		end
		else if(m<4) begin
			G4[m] = G3[m+2] | (P3[m+2]&G3[m-2]);
		end
		else begin
			G4[m] = G3[m+2] | (P3[m+2]&G3[m-2]);
			P4[m] = P3[m-2] & P3[m+2];
		end
	end

	//stage 5 KS
	for(n=0; n<8; n=n+1) begin: stage5_KS
		if(n==0) begin
			G5[n] = G4[n+4] | (P4[n+4]&G1[0]);
		end
		else if(n==1) begin
			G5[n] = G4[n+4] | (P4[n+4]&G2[n-1]);
		end
		else if(n<4) begin
			G5[n] = G4[n+4] | (P4[n+4]&G3[n-2]);
		end
		else begin
			G5[n] = G4[n+4] | (P4[n+4]&G4[n-4]);
		end
	end

	// stage 6 BK
	G6[0] = g[2] | (p[2]&G1[0]);
	G6[1] = g[4] | (p[4]&G2[0]);
	G6[2] = g[6] | (p[6]&G3[0]);
	G6[3] = g[8] | (p[8]&G3[1]);
	G6[4] = g[10] | (p[10]&G4[0]);
	G6[5] = g[12] | (p[12]&G4[1]);
	G6[6] = g[14] | (p[14]&G4[2]);
	G6[7] = g[16] | (p[16]&G4[3]);
	G6[8] = g[18] | (p[18]&G5[0]);
	G6[9] = g[20] | (p[20]&G5[1]);
	G6[10] = g[22] | (p[22]&G5[2]);
	G6[11] = g[24] | (p[24]&G5[3]);
	G6[12] = g[26] | (p[26]&G5[4]);
	G6[13] = g[28] | (p[28]&G5[5]);
	G6[14] = g[30] | (p[30]&G5[6]);
	
	
	//connect G to carry
	{carry[31], carry[29], carry[27], carry[25], carry[23], 
	 carry[21], carry[19], carry[17], carry[15], carry[13], 
	 carry[11], carry[9],  carry[7],  carry[5],  carry[3], carry[1],  carry[0]} = {G5[7:0], G4[3:0], G3[1:0], G2[0], G1[0], g[0]};
	 
	{carry[30], carry[28], carry[26], carry[24], carry[22], carry[20], carry[18], carry[16], carry[14], carry[12], carry[10], carry[8], carry[6], carry[4], carry[2]} = G6;


	//------- full adder -------//
	cout = carry[31];
	sum = p ^ {carry[30:0], 1'b0};


end


endmodule
