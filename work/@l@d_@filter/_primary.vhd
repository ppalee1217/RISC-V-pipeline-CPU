library verilog;
use verilog.vl_types.all;
entity LD_Filter is
    generic(
        lb              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        lh              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        lw              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        lbu             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        lhu             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        func3           : in     vl_logic_vector(2 downto 0);
        ld_data         : in     vl_logic_vector(31 downto 0);
        ld_data_f       : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lb : constant is 1;
    attribute mti_svvh_generic_type of lh : constant is 1;
    attribute mti_svvh_generic_type of lw : constant is 1;
    attribute mti_svvh_generic_type of lbu : constant is 1;
    attribute mti_svvh_generic_type of lhu : constant is 1;
end LD_Filter;
