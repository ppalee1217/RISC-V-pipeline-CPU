module Controller (
    // input
    input clk,
    input rst,
    input [4:0] opcode, rd_index, rs1_index, rs2_index,
    input [2:0] func3,
    input func7, alu_out,
    // output
    // IF stage
    output [3:0] F_im_w_en,

    // ID stage
    output reg D_rs1_data_sel, D_rs2_data_sel,

    // EXE stage
    output reg[1:0] E_rs1_data_sel, E_rs2_data_sel,
    output reg E_jb_op1_sel, E_alu_op2_sel, E_alu_op1_sel, E_func7_C_out,
    output reg [2:0] E_func3_C_out,
    output reg [4:0] E_op_C_out,

    // MEM stage
    output reg[3:0] M_dm_w_en,

    // WB stage
    output reg W_wb_en, W_wb_data_sel,
    output [2:0] W_func3_C_out,
    output [4:0] W_rd_index,

    // other signals
    output reg stall, next_pc_sel
    );

    parameter 
            // opcode
              R_type  = 5'b01100,
              I_Comp  = 5'b00100,
              I_Load  = 5'b00000,
              Store = 5'b01000,
              B_type  = 5'b11000,
              J_jal   = 5'b11011,
              I_jalr  = 5'b11001,
              U_lui   = 5'b01101,
              U_auipc = 5'b00101,
            // func3 for I & R
              Add_Sub = 3'b000,
              Slt     = 3'b010,
              Sltu    = 3'b011,
              Xor     = 3'b100,
              Or      = 3'b110,
              And     = 3'b111,
              Sll     = 3'b001,
              Srl_Sra = 3'b101,
            // func3 for B_type
              beq     = 3'b000,
              bne     = 3'b001,
              blt     = 3'b100,
              bge     = 3'b101,
              bltu    = 3'b110,
              bgeu    = 3'b111,
            // func3 for Store
              sb      = 3'b000,
              sh      = 3'b001,
              sw      = 3'b010;



//// Sequential logic
    // reg declaration
    reg [4:0] E_op, M_op, W_op;
    reg [2:0] E_func3, M_func3, W_func3;
    reg [4:0] E_rd, M_rd, W_rd;
    reg [4:0] E_rs1, E_rs2;
    reg E_func7;

    
    // ID/EXE register
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            E_op <= I_Comp;
            E_func3 <= 3'b000;
            E_rd <= 5'b00000;
            E_rs1 <= 5'b00000;
            E_rs2 <= 5'b00000;
            E_func7 <= 0;
        end
        else if (next_pc_sel || stall) begin
            // instruction addi x0, x0, 0
            E_op <= I_Comp;
            E_func3 <= 3'b000;
            E_rd <= 5'b00000;
            E_rs1 <= 5'b00000;
            E_rs2 <= 5'b00000;
            E_func7 <= 0;
        end
        else begin
            E_op <= opcode;
            E_func3 <= func3;
            E_rd <= rd_index;
            E_rs1 <= rs1_index;
            E_rs2 <= rs2_index;
            E_func7 <= func7;
        end
    end 

    // EXE/MEM register
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            M_op <= I_Comp;
            M_func3 <= 3'b000;
            M_rd <= 5'b00000;
        end
        else begin
            M_op <= E_op;
            M_func3 <= E_func3;
            M_rd <= E_rd;
        end
    end

    // MEM/WB register
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            W_op <= I_Comp;
            W_func3 <= 3'b000;
            W_rd <= 5'b00000;
        end
        else begin
            W_op <= M_op;
            W_func3 <= M_func3;
            W_rd <= M_rd;
        end
    end


//// Combinational logic

    // -----------IF stage----------------//         
    assign F_im_w_en = 4'b0000;

    //------------ID stage----------------//
    /// ID stage (D_rs1_data_sel)
    reg is_D_rs1_W_rd_overlap, is_D_use_rs1, is_W_use_rd;
    // is_D_use_rs1
    always @ (*) begin
       if ((opcode == R_type) || (opcode == I_Comp) || (opcode == I_Load) || 
       (opcode == Store) || (opcode == B_type) || (opcode == I_jalr)) begin
           is_D_use_rs1 = 1;
       end
       else begin
           is_D_use_rs1 = 0;
       end
    end
    // is_W_use_rd
    always @ (*) begin
        if ((W_op == R_type) || (W_op == I_Comp) || (W_op == I_Load) ||
        (W_op == U_lui) || (W_op == U_auipc) || (W_op == J_jal) ||
        (W_op == I_jalr)) begin
            is_W_use_rd = 1;
        end
        else begin
            is_W_use_rd = 0;
        end
    end
    // is_D_rs1_W_rd_overlap
    always @ (*) begin
        is_D_rs1_W_rd_overlap = is_D_use_rs1 & is_W_use_rd & (rs1_index == W_rd) & (W_rd != 0);
    end
    // D_rs1_data_sel
    always @ (*) begin
        D_rs1_data_sel = is_D_rs1_W_rd_overlap ? 1'd0 : 1'd1;
    end
    ///

    /// ID stage (D_rs2_data_sel)
    reg is_D_rs2_W_rd_overlap, is_D_use_rs2;
    // is_D_use_rs2
    always @ (*) begin
       if ((opcode == R_type) || (opcode == Store) || (opcode == B_type)) begin
           is_D_use_rs2 = 1;
       end
       else begin
           is_D_use_rs2 = 0;
       end
    end
    // is_D_rs2_W_rd_overlap
    always @ (*) begin
        is_D_rs2_W_rd_overlap = is_D_use_rs2 & is_W_use_rd & (rs2_index == W_rd) & (W_rd != 0);
    end
    // D_rs2_data_sel
    always @ (*) begin
        D_rs2_data_sel = is_D_rs2_W_rd_overlap ? 1'd0 : 1'd1;
    end
    ///

    // -----------EXE stage----------------//
    /// EXE stage (E_rs1_data_sel)
    reg is_E_rs1_M_rd_overlap, is_E_rs1_W_rd_overlap, is_E_use_rs1, is_M_use_rd;
    // is_E_use_rs1
    always @ (*) begin
        if ((E_op == R_type) || (E_op == I_Comp) || (E_op == I_Load) || 
       (E_op == Store) || (E_op == B_type) || (E_op == I_jalr)) begin
           is_E_use_rs1 = 1;
       end
       else begin
           is_E_use_rs1 = 0;
       end
    end
    // is_M_use_rd
    always @ (*) begin
        if ((M_op == R_type) || (M_op == I_Comp) || (M_op == I_Load) ||
        (M_op == U_lui) || (M_op == U_auipc) || (M_op == J_jal) ||
        (M_op == I_jalr)) begin
            is_M_use_rd = 1;
        end
        else begin
            is_M_use_rd = 0;
        end
    end
    // is_E_rs1_W_rd_overlap & is_E_rs1_M_rd_overlap
    always @ (*) begin
        is_E_rs1_W_rd_overlap = is_E_use_rs1 & is_W_use_rd & (E_rs1 == W_rd) & (W_rd != 0);
        is_E_rs1_M_rd_overlap = is_E_use_rs1 & is_M_use_rd & (E_rs1 == M_rd) & (M_rd != 0);
    end
    // E_rs1_data_sel
    always @ (*) begin
        // E_rs1 overlaping with M_rd has the higher priority over W_rd
        E_rs1_data_sel = is_E_rs1_M_rd_overlap ? 2'd1 : is_E_rs1_W_rd_overlap ? 2'd0 : 2'd2;
    end
    ///

    /// EXE stage (E_rs2_data_sel)
    reg is_E_rs2_M_rd_overlap, is_E_rs2_W_rd_overlap, is_E_use_rs2;
    // is_E_use_rs2
    always @ (*) begin
        if ((E_op == R_type) || (E_op == Store) || (E_op == B_type)) begin
           is_E_use_rs2 = 1;
       end
       else begin
           is_E_use_rs2 = 0;
       end
    end
    // is_E_rs2_W_rd_overlap & is_E_rs2_M_rd_overlap
    always @ (*) begin
        is_E_rs2_W_rd_overlap = is_E_use_rs2 & is_W_use_rd & (E_rs2 == W_rd) & (W_rd != 0);
        is_E_rs2_M_rd_overlap = is_E_use_rs2 & is_M_use_rd & (E_rs2 == M_rd) & (M_rd != 0);
    end
    // E_rs2_data_sel
    always @ (*) begin
        E_rs2_data_sel = is_E_rs2_M_rd_overlap ? 2'd1 : is_E_rs2_W_rd_overlap ? 2'd0 : 2'd2;
    end
    ///

    /// EXE stage(jb_op1_sel)
    always @(*) begin
        // sinal == 0 => PC
        // signal ==1 => rs1_data
        if ((E_op == J_jal) || (E_op == B_type)) begin
            E_jb_op1_sel = 0;
        end
        else begin
            // jalr instruction
            E_jb_op1_sel = 1;
        end
    end

    /// EXE stage(alu_op1_sel)
    always @(*) begin
        // alu_op1 should be rs1 => signal is 1
        if ((E_op == R_type) || (E_op == I_Comp) || 
        (E_op == I_Load) || (E_op == Store) || (E_op == B_type)) begin
            E_alu_op1_sel = 1;
        end
        // alu_op1 should be pc => signal is 0
        else if ((E_op == U_auipc) || (E_op == J_jal) || (E_op == I_jalr)) begin
            E_alu_op1_sel = 0;
        end
        // lui is not important to care
        else begin
            E_alu_op1_sel = 1;
        end
    end

    /// EXE stage(alu_op2_sel)
     always @(*) begin
        // alu_op2 should be imme => signal is 0
        if ((E_op == I_Comp) || (E_op == U_lui) || (E_op == U_auipc)
            || (E_op == I_Load) || (E_op == Store)) begin
            E_alu_op2_sel = 0;
        end
        // alu_op2 should be rs2 => signal is 1
        else if ((E_op == R_type) || (E_op == B_type)) begin
            E_alu_op2_sel = 1;
        end
        // when jalr and jal alu_op2 is not important
        else begin
            E_alu_op2_sel = 1;
        end
    end

    /// E_op_C_out
    always@(*) E_op_C_out = E_op;
    /// E_func3_C_out
    always@(*) E_func3_C_out = E_func3;
    // E_func7_C_out
    always@(*) E_func7_C_out = E_func7;


    // -----------MEM stage----------------//
    /// MEM (M_dm_w_en)
    always @(*) begin
        // Store instructions
        if (M_op == Store) begin
            case(M_func3)
                sb: begin
                    M_dm_w_en = 4'b0001;
                end
                sh: begin 
                    M_dm_w_en = 4'b0011;
                end
                sw: begin
                    M_dm_w_en = 4'b1111;
                end
            endcase
        end
        // Other instructions
        else begin
            M_dm_w_en = 4'b0000;
        end
    end


    // -----------WB stage----------------//
    /// WB (W_wb_en)
    // wb_en => write back rd
    always @(*) begin
        // R_type, Load or I_type computation or U type or J type
        if ((W_op == I_Load) || (W_op == I_Comp) || (W_op == R_type) || 
        (W_op == U_auipc) || (W_op == U_lui) || (W_op == J_jal) || (W_op == I_jalr)) begin
            W_wb_en = 1'b1;
        end
        else begin
            W_wb_en = 1'b0;
        end
    end

    /// WB (W_rd_index)
    assign W_rd_index = W_rd;

    /// WB (W_func3)
    assign W_func3_C_out = W_func3;

    /// WB (W_wb_data_sel)
    always @(*) begin
        // load instructions will give wb_sel = 1 for passing ld_data_f
        if (W_op == I_Load) begin
           W_wb_data_sel = 0;
        end
        else begin
            W_wb_data_sel = 1;
        end
    end

    /// stall signal
    // is_D_rs1_E_rd_overlap
    reg is_DE_overlap, is_D_rs1_E_rd_overlap, is_D_rs2_E_rd_overlap;
    always @ (*) begin
        if (rst) begin
            stall = 0;
        end
        else begin
            is_D_rs1_E_rd_overlap = is_D_use_rs1 & (rs1_index == E_rd) & (E_rd != 0);
            is_D_rs2_E_rd_overlap = is_D_use_rs2 & (rs2_index == E_rd) & (E_rd != 0);
            is_DE_overlap = (is_D_rs1_E_rd_overlap | is_D_rs2_E_rd_overlap);
            stall = (E_op == I_Load) & is_DE_overlap;
        end
    end

    /// next_pc_sel
    always @(*) begin
        if (((E_op == B_type) && alu_out) || (E_op == J_jal) || (E_op == I_jalr)) begin
            // branch
            next_pc_sel = 1;
        end
        else begin
            // pc + 4
            next_pc_sel = 0;
        end
    end


endmodule
