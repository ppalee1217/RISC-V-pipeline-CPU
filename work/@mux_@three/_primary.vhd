library verilog;
use verilog.vl_types.all;
entity Mux_Three is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        d               : out    vl_logic_vector(31 downto 0)
    );
end Mux_Three;
