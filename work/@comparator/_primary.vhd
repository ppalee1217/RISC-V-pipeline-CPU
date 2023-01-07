library verilog;
use verilog.vl_types.all;
entity Comparator is
    port(
        Tag1            : in     vl_logic_vector(15 downto 10);
        Tag2            : in     vl_logic_vector(15 downto 10);
        Match           : out    vl_logic
    );
end Comparator;
