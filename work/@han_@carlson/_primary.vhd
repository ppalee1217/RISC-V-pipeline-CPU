library verilog;
use verilog.vl_types.all;
entity Han_Carlson is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        sum             : out    vl_logic_vector(31 downto 0);
        cout            : out    vl_logic
    );
end Han_Carlson;
