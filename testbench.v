`timescale 1ns/10ps
`include "IM.v"
`include "DM.v"
`ifdef syn
  `include "CPU_syn.v"
  `include "tsmc18.v"
`else
  `include "CPU.v"
`endif
`define GOLDEN_HEX_NAME "./test/test1/golden.hex"

module tb;
  reg clk, rst;
  parameter CLK_PERIOD = 5;
  parameter MAX = 1000;
  always #CLK_PERIOD clk = ~clk;

  integer i, err, hex_line;
  wire [31:0] inst_IF, dm_read_data, current_pc, reg_ex_mem_alu_out_out, reg_ex_mem_rs2_data_out;
  wire [3:0] F_im_w_en, M_dm_w_en;
  reg [7:0] answer [0:4095];

  IM IM(
    .clk(clk),
    .w_en(F_im_w_en),
    .address(current_pc[15:0]),
    .write_data(32'd0),
    .read_data(inst_IF)
  );
  DM DM(
    .clk(clk),
    .w_en(M_dm_w_en),
    .address(reg_ex_mem_alu_out_out[15:0]),
    .write_data(reg_ex_mem_rs2_data_out),
    .read_data(dm_read_data)
  );
  CPU CPU(
    .clk(clk),
    .rst(rst),
    .inst_IF(inst_IF),
    .dm_read_data(dm_read_data),
    .F_im_w_en(F_im_w_en),
    .current_pc(current_pc),
    .reg_ex_mem_alu_out_out(reg_ex_mem_alu_out_out),
    .M_dm_w_en(M_dm_w_en),
    .reg_ex_mem_rs2_data_out(reg_ex_mem_rs2_data_out)
  );

  // SDF annotation
  `ifdef syn
    initial $sdf_annotate("CPU_syn.sdf", CPU);
  `endif

  // Read golden hex from file
  initial begin
    $readmemh(`GOLDEN_HEX_NAME, answer);
  end

  // Initialize
  initial begin
    $display("Reset...");
    clk = 0;
    rst = 1;
    #(CLK_PERIOD*4);
    rst = 0;
    $display("----------------------");
    $display("-- Simulation Start --");
    $display("----------------------");
  end

  // Stop simulation after MAX cycles
  initial begin
    #(CLK_PERIOD*2*MAX)
    $finish;
  end

  // Generate waveform
  // initial begin
  //   $dumpfile("wave.fsdb");
  //   $dumpvars;
  // end

  // Stop simulation when inst_IF is all X
  always @(posedge clk) begin
    if(!rst) begin
      if(inst_IF === 32'bx) begin
        $display("Wait for pipeline to flush...");
        #(CLK_PERIOD*8);
        $display("============================");
        err = 0;
        hex_line = 0;
        $display("Compare RegisterFile Data:");
        for(i=0; i<32; i=i+1) begin
          `ifdef syn
            if(CPU.regfile.\registers[i] != {answer[hex_line+3],answer[hex_line+2],answer[hex_line+1],answer[hex_line]}) begin
              $display("Error: Reg[%d] = %h, Golden = %h", i, CPU.regfile.\registers[i], {answer[hex_line+3],answer[hex_line+2],answer[hex_line+1],answer[hex_line]});
              err = err + 1;
            end
          `else
            if(CPU.regfile.registers[i] != {answer[hex_line+3],answer[hex_line+2],answer[hex_line+1],answer[hex_line]}) begin
              $display("Error: Reg[%d] = %h, Golden = %h", i, CPU.regfile.registers[i], {answer[hex_line+3],answer[hex_line+2],answer[hex_line+1],answer[hex_line]});
              err = err + 1;
            end
          `endif
          hex_line = hex_line + 4;
        end
        $display("============================");
        $display("Compare Memory Data:");
        #(clk*4);
        if(err == 0) $display("No error found in this test.");
        else $display("Total %d errors.", err);
        $display("----------------------");
        $display(" Simulation  finished ");
        $display("----------------------");
        $finish;
      end
    end
  end

  // Print out current status
  always @(inst_IF or rst) begin
    $display("PC: %d",current_pc);
    $display("Instruction:\t0x%h",inst_IF);
    $display("Alu Result:\t0x%h",reg_ex_mem_alu_out_out);
    $display("Data address:\t0x%h",reg_ex_mem_alu_out_out[15:0]);
    $display("Data Output (from CPU to memory): 0x%h", reg_ex_mem_rs2_data_out);
    `ifdef syn
      $display("Reg[ 0]: %h Reg[ 1]: %h Reg[ 2]: %h Reg[ 3]: %h",CPU.regfile.\registers[0], CPU.regfile.\registers[1], CPU.regfile.\registers[2], CPU.regfile.\registers[3]);
      $display("Reg[ 4]: %h Reg[ 5]: %h Reg[ 6]: %h Reg[ 7]: %h",CPU.regfile.\registers[4], CPU.regfile.\registers[5], CPU.regfile.\registers[6], CPU.regfile.\registers[7]);
      $display("Reg[ 8]: %h Reg[ 9]: %h Reg[ 10]: %h Reg[ 11]: %h",CPU.regfile.\registers[8], CPU.regfile.\registers[9], CPU.regfile.\registers[10], CPU.regfile.\registers[11]);
      $display("Reg[12]: %h Reg[13]: %h Reg[14]: %h Reg[15]: %h",CPU.regfile.\registers[12], CPU.regfile.\registers[13], CPU.regfile.\registers[14], CPU.regfile.\registers[15]);
      $display("Reg[16]: %h Reg[17]: %h Reg[18]: %h Reg[19]: %h",CPU.regfile.\registers[16], CPU.regfile.\registers[17], CPU.regfile.\registers[18], CPU.regfile.\registers[19]);
      $display("Reg[20]: %h Reg[21]: %h Reg[22]: %h Reg[23]: %h",CPU.regfile.\registers[20], CPU.regfile.\registers[21], CPU.regfile.\registers[22], CPU.regfile.\registers[23]);
      $display("Reg[24]: %h Reg[25]: %h Reg[26]: %h Reg[27]: %h",CPU.regfile.\registers[24], CPU.regfile.\registers[25], CPU.regfile.\registers[26], CPU.regfile.\registers[27]);
      $display("Reg[28]: %h Reg[29]: %h Reg[30]: %h Reg[31]: %h",CPU.regfile.\registers[28], CPU.regfile.\registers[29], CPU.regfile.\registers[30], CPU.regfile.\registers[31]);
    `else
      $display("Reg[ 0]: %h Reg[ 1]: %h Reg[ 2]: %h Reg[ 3]: %h",CPU.regfile.registers[0], CPU.regfile.registers[1], CPU.regfile.registers[2], CPU.regfile.registers[3]);
      $display("Reg[ 4]: %h Reg[ 5]: %h Reg[ 6]: %h Reg[ 7]: %h",CPU.regfile.registers[4], CPU.regfile.registers[5], CPU.regfile.registers[6], CPU.regfile.registers[7]);
      $display("Reg[ 8]: %h Reg[ 9]: %h Reg[10]: %h Reg[11]: %h",CPU.regfile.registers[8], CPU.regfile.registers[9], CPU.regfile.registers[10], CPU.regfile.registers[11]);
      $display("Reg[12]: %h Reg[13]: %h Reg[14]: %h Reg[15]: %h",CPU.regfile.registers[12], CPU.regfile.registers[13], CPU.regfile.registers[14], CPU.regfile.registers[15]);
      $display("Reg[16]: %h Reg[17]: %h Reg[18]: %h Reg[19]: %h",CPU.regfile.registers[16], CPU.regfile.registers[17], CPU.regfile.registers[18], CPU.regfile.registers[19]);
      $display("Reg[20]: %h Reg[21]: %h Reg[22]: %h Reg[23]: %h",CPU.regfile.registers[20], CPU.regfile.registers[21], CPU.regfile.registers[22], CPU.regfile.registers[23]);
      $display("Reg[24]: %h Reg[25]: %h Reg[26]: %h Reg[27]: %h",CPU.regfile.registers[24], CPU.regfile.registers[25], CPU.regfile.registers[26], CPU.regfile.registers[27]);
      $display("Reg[28]: %h Reg[29]: %h Reg[30]: %h Reg[31]: %h",CPU.regfile.registers[28], CPU.regfile.registers[29], CPU.regfile.registers[30], CPU.regfile.registers[31]);
    `endif
    $display("===================================================");
  end
endmodule
