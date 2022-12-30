library verilog;
use verilog.vl_types.all;
entity half_adder_1 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        sum             : out    vl_logic;
        cout            : out    vl_logic
    );
end half_adder_1;
