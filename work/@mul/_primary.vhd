library verilog;
use verilog.vl_types.all;
entity Mul is
    generic(
        BITWIDTH        : integer := 16
    );
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        product         : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITWIDTH : constant is 1;
end Mul;
