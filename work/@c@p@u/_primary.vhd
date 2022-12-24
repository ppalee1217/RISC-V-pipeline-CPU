library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inst_IF         : in     vl_logic_vector(31 downto 0);
        dm_read_data    : in     vl_logic_vector(31 downto 0);
        F_im_w_en       : out    vl_logic_vector(3 downto 0);
        current_pc      : out    vl_logic_vector(31 downto 0);
        reg_ex_mem_alu_out_out: out    vl_logic_vector(31 downto 0);
        M_dm_w_en       : out    vl_logic_vector(3 downto 0);
        reg_ex_mem_rs2_data_out: out    vl_logic_vector(31 downto 0)
    );
end CPU;
