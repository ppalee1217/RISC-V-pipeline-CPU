library verilog;
use verilog.vl_types.all;
entity ValidRam is
    port(
        Address         : in     vl_logic_vector(9 downto 0);
        ValidIn         : in     vl_logic;
        ValidOut        : out    vl_logic;
        Write           : in     vl_logic;
        Reset           : in     vl_logic;
        Clk             : in     vl_logic
    );
end ValidRam;
