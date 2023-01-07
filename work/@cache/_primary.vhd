library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        PStrobe         : in     vl_logic;
        PAddress        : in     vl_logic_vector(15 downto 0);
        PData           : inout  vl_logic_vector(31 downto 0);
        PRW             : in     vl_logic_vector(3 downto 0);
        PReady          : out    vl_logic;
        SysStrobe       : out    vl_logic;
        SysAddress      : out    vl_logic_vector(15 downto 0);
        SysData         : inout  vl_logic_vector(31 downto 0);
        SysRW           : out    vl_logic_vector(3 downto 0);
        Reset           : in     vl_logic;
        Clk             : in     vl_logic
    );
end Cache;
