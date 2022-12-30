library verilog;
use verilog.vl_types.all;
entity row_LSB_1 is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic_vector(1 downto 0);
        lsb             : out    vl_logic
    );
end row_LSB_1;
