library verilog;
use verilog.vl_types.all;
entity Reg_IF_ID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        stall           : in     vl_logic;
        stall_cache     : in     vl_logic;
        jb              : in     vl_logic;
        current_pc_in   : in     vl_logic_vector(31 downto 0);
        inst_in         : in     vl_logic_vector(31 downto 0);
        inst_out        : out    vl_logic_vector(31 downto 0);
        current_pc_out  : out    vl_logic_vector(31 downto 0)
    );
end Reg_IF_ID;
