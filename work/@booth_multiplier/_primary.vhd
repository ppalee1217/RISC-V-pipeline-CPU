library verilog;
use verilog.vl_types.all;
entity Booth_multiplier is
    generic(
        BITWIDTH        : integer := 16
    );
    port(
        X               : in     vl_logic_vector;
        Y               : in     vl_logic_vector;
        row0            : out    vl_logic_vector;
        row1            : out    vl_logic_vector;
        row2            : out    vl_logic_vector;
        row3            : out    vl_logic_vector;
        row4            : out    vl_logic_vector;
        row5            : out    vl_logic_vector;
        row6            : out    vl_logic_vector;
        row7            : out    vl_logic_vector;
        add             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITWIDTH : constant is 1;
end Booth_multiplier;
