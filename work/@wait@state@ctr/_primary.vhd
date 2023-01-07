library verilog;
use verilog.vl_types.all;
entity WaitStateCtr is
    port(
        Load            : in     vl_logic;
        LoadValue       : in     vl_logic_vector(1 downto 0);
        Carry           : out    vl_logic;
        Clk             : in     vl_logic
    );
end WaitStateCtr;
