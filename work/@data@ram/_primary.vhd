library verilog;
use verilog.vl_types.all;
entity DataRam is
    port(
        Address         : in     vl_logic_vector(9 downto 0);
        DataIn          : in     vl_logic_vector(31 downto 0);
        DataOut         : out    vl_logic_vector(31 downto 0);
        Write           : in     vl_logic;
        PRW             : in     vl_logic_vector(3 downto 0);
        Clk             : in     vl_logic;
        Reset           : in     vl_logic
    );
end DataRam;
