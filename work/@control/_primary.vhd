library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        PStrobe         : in     vl_logic;
        PRW             : in     vl_logic_vector(3 downto 0);
        PReady          : out    vl_logic;
        Match           : in     vl_logic;
        Valid           : in     vl_logic;
        Write           : out    vl_logic;
        CacheDataSelect : out    vl_logic;
        PDataSelect     : out    vl_logic;
        SysDataOE       : out    vl_logic;
        PDataOE         : out    vl_logic;
        SysStrobe       : out    vl_logic;
        SysRW           : out    vl_logic_vector(3 downto 0);
        Reset           : in     vl_logic;
        Clk             : in     vl_logic
    );
end Control;
