library verilog;
use verilog.vl_types.all;
entity Reg_MEM_WB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        stall_cache     : in     vl_logic;
        stall           : in     vl_logic;
        alu_out_in      : in     vl_logic_vector(31 downto 0);
        ld_data_in      : in     vl_logic_vector(31 downto 0);
        current_pc_in   : in     vl_logic_vector(31 downto 0);
        alu_out_out     : out    vl_logic_vector(31 downto 0);
        ld_data_out     : out    vl_logic_vector(31 downto 0);
        current_pc_out  : out    vl_logic_vector(31 downto 0)
    );
end Reg_MEM_WB;
