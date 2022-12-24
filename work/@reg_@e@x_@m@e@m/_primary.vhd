library verilog;
use verilog.vl_types.all;
entity Reg_EX_MEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        alu_out_in      : in     vl_logic_vector(31 downto 0);
        rs2_data_in     : in     vl_logic_vector(31 downto 0);
        current_pc_in   : in     vl_logic_vector(31 downto 0);
        alu_out_out     : out    vl_logic_vector(31 downto 0);
        rs2_data_out    : out    vl_logic_vector(31 downto 0);
        current_pc_out  : out    vl_logic_vector(31 downto 0)
    );
end Reg_EX_MEM;
