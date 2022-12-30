library verilog;
use verilog.vl_types.all;
entity Booth_encoder_7 is
    port(
        y               : in     vl_logic_vector(2 downto 0);
        NEG             : out    vl_logic;
        X1              : out    vl_logic;
        X2P             : out    vl_logic;
        ZP              : out    vl_logic
    );
end Booth_encoder_7;
