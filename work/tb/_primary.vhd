library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        CLK_PERIOD      : integer := 5;
        MAX             : integer := 10000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of MAX : constant is 1;
end tb;
