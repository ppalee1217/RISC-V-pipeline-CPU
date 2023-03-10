library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        R_type          : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        I_Comp          : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        I_Load          : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        Store           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        B_type          : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi0, Hi0);
        J_jal           : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi1, Hi1);
        I_jalr          : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi0, Hi1);
        U_lui           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        U_auipc         : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        Add_Sub         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        Slt             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        Sltu            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \Xor\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        \Or\            : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        \And\           : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        \Sll\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        Srl_Sra         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        beq             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        bne             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        blt             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        bge             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        bltu            : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        bgeu            : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        sb              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        sh              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        sw              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PReady          : in     vl_logic;
        opcode          : in     vl_logic_vector(4 downto 0);
        rd_index        : in     vl_logic_vector(4 downto 0);
        rs1_index       : in     vl_logic_vector(4 downto 0);
        rs2_index       : in     vl_logic_vector(4 downto 0);
        func3           : in     vl_logic_vector(2 downto 0);
        func7           : in     vl_logic_vector(6 downto 0);
        alu_out         : in     vl_logic;
        D_rs1_data_sel  : out    vl_logic;
        D_rs2_data_sel  : out    vl_logic;
        E_rs1_data_sel  : out    vl_logic_vector(1 downto 0);
        E_rs2_data_sel  : out    vl_logic_vector(1 downto 0);
        E_jb_op1_sel    : out    vl_logic;
        E_alu_op2_sel   : out    vl_logic;
        E_alu_op1_sel   : out    vl_logic;
        E_func7_C_out   : out    vl_logic_vector(6 downto 0);
        E_func3_C_out   : out    vl_logic_vector(2 downto 0);
        E_op_C_out      : out    vl_logic_vector(4 downto 0);
        M_dm_w_en       : out    vl_logic_vector(3 downto 0);
        PStrobe         : out    vl_logic;
        W_wb_en         : out    vl_logic;
        W_wb_data_sel   : out    vl_logic;
        W_func3_C_out   : out    vl_logic_vector(2 downto 0);
        W_rd_index      : out    vl_logic_vector(4 downto 0);
        stall           : out    vl_logic;
        next_pc_sel     : out    vl_logic;
        stall_cache     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R_type : constant is 1;
    attribute mti_svvh_generic_type of I_Comp : constant is 1;
    attribute mti_svvh_generic_type of I_Load : constant is 1;
    attribute mti_svvh_generic_type of Store : constant is 1;
    attribute mti_svvh_generic_type of B_type : constant is 1;
    attribute mti_svvh_generic_type of J_jal : constant is 1;
    attribute mti_svvh_generic_type of I_jalr : constant is 1;
    attribute mti_svvh_generic_type of U_lui : constant is 1;
    attribute mti_svvh_generic_type of U_auipc : constant is 1;
    attribute mti_svvh_generic_type of Add_Sub : constant is 1;
    attribute mti_svvh_generic_type of Slt : constant is 1;
    attribute mti_svvh_generic_type of Sltu : constant is 1;
    attribute mti_svvh_generic_type of \Xor\ : constant is 1;
    attribute mti_svvh_generic_type of \Or\ : constant is 1;
    attribute mti_svvh_generic_type of \And\ : constant is 1;
    attribute mti_svvh_generic_type of \Sll\ : constant is 1;
    attribute mti_svvh_generic_type of Srl_Sra : constant is 1;
    attribute mti_svvh_generic_type of beq : constant is 1;
    attribute mti_svvh_generic_type of bne : constant is 1;
    attribute mti_svvh_generic_type of blt : constant is 1;
    attribute mti_svvh_generic_type of bge : constant is 1;
    attribute mti_svvh_generic_type of bltu : constant is 1;
    attribute mti_svvh_generic_type of bgeu : constant is 1;
    attribute mti_svvh_generic_type of sb : constant is 1;
    attribute mti_svvh_generic_type of sh : constant is 1;
    attribute mti_svvh_generic_type of sw : constant is 1;
end Controller;
