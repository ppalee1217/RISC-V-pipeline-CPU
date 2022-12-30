library verilog;
use verilog.vl_types.all;
entity Booth_decoder_63 is
    port(
        x               : in     vl_logic_vector(1 downto 0);
        NEG             : in     vl_logic;
        X1              : in     vl_logic;
        X2P             : in     vl_logic;
        ZP              : in     vl_logic;
        PP              : out    vl_logic
    );
end Booth_decoder_63;
