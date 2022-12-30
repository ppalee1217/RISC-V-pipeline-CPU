library verilog;
use verilog.vl_types.all;
entity Dadda is
    generic(
        BITWIDTH        : integer := 16
    );
    port(
        row0            : in     vl_logic_vector(16 downto 0);
        row1            : in     vl_logic_vector(16 downto 0);
        row2            : in     vl_logic_vector(16 downto 0);
        row3            : in     vl_logic_vector(16 downto 0);
        row4            : in     vl_logic_vector(16 downto 0);
        row5            : in     vl_logic_vector(16 downto 0);
        row6            : in     vl_logic_vector(16 downto 0);
        row7            : in     vl_logic_vector(16 downto 0);
        add             : in     vl_logic_vector(7 downto 0);
        in_sumRow       : in     vl_logic_vector(32 downto 0);
        in_carryRow     : in     vl_logic_vector(32 downto 1);
        out_sumRow      : out    vl_logic_vector(32 downto 0);
        out_carryRow    : out    vl_logic_vector(32 downto 1)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITWIDTH : constant is 1;
end Dadda;
