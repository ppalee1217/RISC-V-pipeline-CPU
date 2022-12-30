library verilog;
use verilog.vl_types.all;
entity Mul_syn is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        product         : out    vl_logic_vector(31 downto 0)
    );
end Mul_syn;
