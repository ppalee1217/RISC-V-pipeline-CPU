library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        clk             : in     vl_logic;
        w_en            : in     vl_logic_vector(3 downto 0);
        address         : in     vl_logic_vector(15 downto 0);
        data            : inout  vl_logic_vector(31 downto 0)
    );
end DM;
