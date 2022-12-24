library verilog;
use verilog.vl_types.all;
entity Imme_Ext is
    generic(
        R_type          : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        I_Comp          : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        I_Load          : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        Store           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        B_type          : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi0, Hi0);
        J_jal           : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi1, Hi1);
        I_jalr          : vl_logic_vector(0 to 4) := (Hi1, Hi1, Hi0, Hi0, Hi1);
        U_lui           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        U_auipc         : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1)
    );
    port(
        inst            : in     vl_logic_vector(31 downto 0);
        imm_ext_out     : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R_type : constant is 1;
    attribute mti_svvh_generic_type of I_Comp : constant is 1;
    attribute mti_svvh_generic_type of I_Load : constant is 1;
    attribute mti_svvh_generic_type of Store : constant is 1;
    attribute mti_svvh_generic_type of B_type : constant is 1;
    attribute mti_svvh_generic_type of J_jal : constant is 1;
    attribute mti_svvh_generic_type of I_jalr : constant is 1;
    attribute mti_svvh_generic_type of U_lui : constant is 1;
    attribute mti_svvh_generic_type of U_auipc : constant is 1;
end Imme_Ext;
