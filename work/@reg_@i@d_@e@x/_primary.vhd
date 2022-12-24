library verilog;
use verilog.vl_types.all;
entity Reg_ID_EX is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        stall           : in     vl_logic;
        jb              : in     vl_logic;
        current_pc_in   : in     vl_logic_vector(31 downto 0);
        rs1_data_in     : in     vl_logic_vector(31 downto 0);
        rs2_data_in     : in     vl_logic_vector(31 downto 0);
        sext_imm_in     : in     vl_logic_vector(31 downto 0);
        current_pc_out  : out    vl_logic_vector(31 downto 0);
        rs1_data_out    : out    vl_logic_vector(31 downto 0);
        rs2_data_out    : out    vl_logic_vector(31 downto 0);
        sext_imm_out    : out    vl_logic_vector(31 downto 0)
    );
end Reg_ID_EX;
