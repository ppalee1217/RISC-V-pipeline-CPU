library verilog;
use verilog.vl_types.all;
entity complement_0 is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic_vector(2 downto 0);
        ADD             : out    vl_logic
    );
end complement_0;
