`include "./src/ALU.v"
`include "./src/Controller.v"
`include "./src/Decoder.v"
`include "./src/Imme_Ext.v"
`include "./src/JB_Unit.v"
`include "./src/LD_Filter.v"
`include "./src/Mux.v"
`include "./src/Mux_Three.v"
`include "./src/Reg_EX_MEM.v"
`include "./src/Reg_ID_EX.v"
`include "./src/Reg_IF_ID.v"
`include "./src/Reg_MEM_WB.v"
`include "./src/Reg_PC.v"
`include "./src/RegFile.v"

module CPU (
    input  clk, 
    input  rst,
    input  [31:0] inst_IF,
    input  [31:0] dm_read_data,
    output [3:0]  F_im_w_en,
    output [31:0] current_pc,
    output [31:0] reg_ex_mem_alu_out_out,
    output [3:0]  M_dm_w_en,
    output [31:0] reg_ex_mem_rs2_data_out
    );


    integer i;
/// Controller
    wire [4:0] dc_out_opcode, 
	       dc_out_rd_index, 
               dc_out_rs1_index, 
               dc_out_rs2_index;
    wire [2:0] dc_out_func3;
    wire       dc_out_func7;
    // output
    wire stall, 
         next_pc_sel,
        D_rs1_data_sel,
        D_rs2_data_sel,
        E_jb_op1_sel,
        E_alu_op1_sel,
        E_alu_op2_sel,
        W_wb_en,
        W_wb_data_sel,
        E_func7_C_out;

    wire [1:0] E_rs1_data_sel, E_rs2_data_sel;
    wire [2:0] E_func3_C_out, W_func3_C_out;
    wire [4:0] E_op_C_out, W_rd_index;
  
    /*
    always @(posedge rst) begin
        if(rst) begin
            for(i=0;i<32;i=i+1) begin
                regfile.registers[i] <= 32'd0;
            end
        end
    end
    */
    wire [31:0] alu_out;
    Controller controller (
        // input port
        .clk(clk),
        .rst(rst),
        .opcode(dc_out_opcode),
        .func3(dc_out_func3),
        .func7(dc_out_func7),
        .rd_index(dc_out_rd_index),
        .rs1_index(dc_out_rs1_index),
        .rs2_index(dc_out_rs2_index),
        .alu_out(alu_out[0]),
        // output port
        .stall(stall),
        .next_pc_sel(next_pc_sel),
        .F_im_w_en(F_im_w_en),
        .D_rs1_data_sel(D_rs1_data_sel),
        .D_rs2_data_sel(D_rs2_data_sel),
        .E_rs1_data_sel(E_rs1_data_sel),
        .E_rs2_data_sel(E_rs2_data_sel),
        .E_jb_op1_sel(E_jb_op1_sel),
        .E_alu_op1_sel(E_alu_op1_sel),
        .E_alu_op2_sel(E_alu_op2_sel),
        .E_op_C_out(E_op_C_out),
        .E_func3_C_out(E_func3_C_out),
        .E_func7_C_out(E_func7_C_out),
        .M_dm_w_en(M_dm_w_en),
        .W_wb_en(W_wb_en),
        .W_rd_index(W_rd_index),
        .W_func3_C_out(W_func3_C_out),
        .W_wb_data_sel(W_wb_data_sel)
    );

/// Mux_pc
    wire [31:0] current_pc_plus_4,
		jb_out,
		next_pc;
    assign current_pc_plus_4 = current_pc + 4;
    
    Mux mux_pc (
        .c(next_pc), 
        .a(jb_out),
        .b(current_pc_plus_4),
        .s(next_pc_sel)
    );
/// Reg_PC
    Reg_PC reg_pc (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .current_pc(current_pc),
        .stall(stall)
    );
/// IF/ID register
    wire [31:0] inst_ID,current_pc_ID;
    Reg_IF_ID reg_if_id (
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .jb(next_pc_sel),
        .inst_in(inst_IF),
        .current_pc_in(current_pc),
        .inst_out(inst_ID),
        .current_pc_out(current_pc_ID)
    ); 
/// Decoder
    Decoder decoder (
        .inst(inst_ID),
        .dc_out_opcode(dc_out_opcode),
        .dc_out_func3(dc_out_func3),
        .dc_out_func7(dc_out_func7),
        .dc_out_rs1_index(dc_out_rs1_index),
        .dc_out_rs2_index(dc_out_rs2_index),
        .dc_out_rd_index(dc_out_rd_index)
    );
/// Imme_Ext
    wire [31:0] imm_ext_out;
    Imme_Ext imme_ext (
        .inst(inst_ID),
        .imm_ext_out(imm_ext_out)
    );
/// RegFile
    wire [31:0] rs1_data_out, rs2_data_out, mux_wb_data_c;
    RegFile regfile (
        // input
        .clk(clk),
        .rs1_index(dc_out_rs1_index),
        .rs2_index(dc_out_rs2_index),
        .rd_index(W_rd_index),
        .wb_en(W_wb_en),
        .wb_data(mux_wb_data_c),
        // output
        .rs1_data_out(rs1_data_out),
        .rs2_data_out(rs2_data_out)
    );
/// D_mux_rs1
    wire [31:0] rs1_data_muxed;
    Mux D_mux_rs1 (
        .a(rs1_data_out),
        .b(mux_wb_data_c),
        .s(D_rs1_data_sel),
        .c(rs1_data_muxed)
    );
/// D_mux_rs2
    wire [31:0] rs2_data_muxed;
    Mux D_mux_rs2 (
        .a(rs2_data_out),
        .b(mux_wb_data_c),
        .s(D_rs2_data_sel),
        .c(rs2_data_muxed)
    );
/// Reg_ID_EX
    wire [31:0] current_pc_EX, 
                sext_imm_out,
                reg_id_ex_rs1_data_out,
                reg_id_ex_rs2_data_out;
    Reg_ID_EX reg_id_ex (
        // input
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .jb(next_pc_sel),
        .current_pc_in(current_pc_ID),
        .sext_imm_in(imm_ext_out),
        .rs1_data_in(rs1_data_muxed),
        .rs2_data_in(rs2_data_muxed),
        // output
        .rs1_data_out(reg_id_ex_rs1_data_out),
        .rs2_data_out(reg_id_ex_rs2_data_out),
        .current_pc_out(current_pc_EX),
        .sext_imm_out(sext_imm_out)
    );
/// E_mux_rs1
    wire [31:0] E_mux_rs1_data_out;
    Mux_Three E_mux_rs1 (
        .a(mux_wb_data_c),
        .b(reg_ex_mem_alu_out_out),
        .c(reg_id_ex_rs1_data_out),
        .s(E_rs1_data_sel),
        .d(E_mux_rs1_data_out)
    );
/// E_mux_rs2
    wire [31:0] E_mux_rs2_data_out;
    Mux_Three E_mux_rs2 (
        .a(mux_wb_data_c),
        .b(reg_ex_mem_alu_out_out),
        .c(reg_id_ex_rs2_data_out),
        .s(E_rs2_data_sel),
        .d(E_mux_rs2_data_out)
    );
/// E_mux_alu_op1
    wire [31:0] E_mux_alu_op1_out;
    Mux E_mux_alu_op1 (
        .a(E_mux_rs1_data_out),
        .b(current_pc_EX),
        .s(E_alu_op1_sel),
        .c(E_mux_alu_op1_out)
    );
/// E_mux_alu_op2
    wire [31:0] E_mux_alu_op2_out;
    Mux E_mux_alu_op2 (
        .a(E_mux_rs2_data_out),
        .b(sext_imm_out),
        .s(E_alu_op2_sel),
        .c(E_mux_alu_op2_out)
    );
/// ALU
    ALU alu (
        .opcode(E_op_C_out),
        .func3(E_func3_C_out),
        .func7(E_func7_C_out),
        .operand1(E_mux_alu_op1_out),
        .operand2(E_mux_alu_op2_out),
        .alu_out(alu_out)
    );
/// mux_jb
    wire [31:0] mux_jb_out;
    Mux mux_jb (
        .a(E_mux_rs1_data_out),
        .b(current_pc_EX),
        .s(E_jb_op1_sel),
        .c(mux_jb_out)
    );
/// JB_Unit
    JB_Unit jb_unit (
        .operand1(mux_jb_out),
        .operand2(sext_imm_out),
        .jb_out(jb_out)
    );
/// Reg_EX_MEM
    wire [31:0] current_pc_MEM;
    Reg_EX_MEM reg_ex_mem (
        // input
        .clk(clk),
        .rst(rst),
        .alu_out_in(alu_out),
        .rs2_data_in(E_mux_rs2_data_out),
        .current_pc_in(current_pc_EX),
        // output
        .alu_out_out(reg_ex_mem_alu_out_out),
        .rs2_data_out(reg_ex_mem_rs2_data_out),
        .current_pc_out(current_pc_MEM)
    );
/// Reg_MEM_WB
    wire [31:0] reg_mem_wb_alu_out_out,
		ld_data_out,
		current_pc_WB;
    Reg_MEM_WB reg_mem_wb (
        .clk(clk),
        .rst(rst),
        .alu_out_in(reg_ex_mem_alu_out_out),
        .ld_data_in(dm_read_data),
        .current_pc_in(current_pc_MEM),
        .alu_out_out(reg_mem_wb_alu_out_out),
        .ld_data_out(ld_data_out),
        .current_pc_out(current_pc_WB)
    );
/// LD_Filter
    wire [31:0] ld_data_f;
    LD_Filter ld_filter (
        .func3(W_func3_C_out),
        .ld_data(ld_data_out),
        .ld_data_f(ld_data_f)
    );
/// Mux_wb_data
    Mux mux_wb_data (
        .a(reg_mem_wb_alu_out_out),
        .b(ld_data_f),
        .s(W_wb_data_sel),
        .c(mux_wb_data_c)   
    );
endmodule



