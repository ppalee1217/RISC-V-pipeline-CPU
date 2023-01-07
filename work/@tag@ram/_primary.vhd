library verilog;
use verilog.vl_types.all;
entity TagRam is
    port(
        Address         : in     vl_logic_vector(9 downto 0);
        TagIn           : in     vl_logic_vector(15 downto 10);
        TagOut          : out    vl_logic_vector(15 downto 10);
        Write           : in     vl_logic;
        Clk             : in     vl_logic
    );
end TagRam;
