`timescale 1ns/10ps

`include "SRAM.v"
`ifdef syn
  `include "CPU_syn.v"
  `include "tsmc18.v"
`else
  `include "CPU.v"
`endif

`define CYCLE 10.0    // Cycle time
`define MAX 10000000  // Max cycle number
`define prog_path "./test/inst_check/main.hex"
`define gold_path "./test/inst_check/golden.hex"
`define ANSWER_START 'h9000
`define mem_word(addr) \
  {DM.mem[addr+3], \
   DM.mem[addr+2], \
   DM.mem[addr+1], \
   DM.mem[addr]}

module tb;
  reg clk, rst;
  parameter CLK_PERIOD = 5;
  parameter MAX = 1000;
  always #CLK_PERIOD clk = ~clk;

  wire [31:0] inst_IF, dm_read_data, current_pc, reg_ex_mem_alu_out_out, reg_ex_mem_rs2_data_out;
  wire [3:0] F_im_w_en, M_dm_w_en;
  reg [7:0] answer [0:4095];
  reg [31:0] GOLDEN [0:73];

  integer gf;               // pointer of golden file
  integer num;              // total golden data
  integer err;              // total number of errors compared to golden data
  integer i;
  integer inst_num;

  SRAM IM(
    .clk(clk),
    .w_en(F_im_w_en),
    .address(current_pc[15:0]),
    .write_data(32'd0),
    .read_data(inst_IF)
  );
  SRAM DM(
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

  initial begin
    // Initialize
    $display("Reset...");
    clk = 0;
    rst = 1;
    #(CLK_PERIOD*4);
    @(posedge clk) rst = 0;
    inst_num = 0;
    $display("----------------------");
    $display("-- Simulation Start --");
    $display("----------------------");
    // Load program and preset data to im & dm 
    $readmemh(`prog_path, IM.mem);
    $readmemh(`prog_path, DM.mem);
    // Initialize part of the memory (needed by the test program)
    `mem_word('h9078) = 32'd0;
    `mem_word('h907c) = 32'd0;
    `mem_word('h9080) = 32'd0;
    `mem_word('h9084) = 32'd0;
    `mem_word('hfffc) = 32'd0;
    // Initialize register[0] = 0 (hardwire to ground)
    CPU.regfile.registers[0] = 32'd0;
    // Load Golden Data
    num = 0;
    gf = $fopen(`gold_path, "r");
    while (!$feof(gf)) begin
      $fscanf(gf, "%h\n", GOLDEN[num]);
      num = num + 1;
    end
    $fclose(gf);
    // Wait until end of execution
    wait(DM.mem[16'hfffc] == 8'hff);
    $display("\nExecution Done...\n");
    $display("Compare answer with golden data:");
    $display("============================");
    // Check answer
    err = 0;
    for (i = 0; i < num; i = i + 1) begin
      if (`mem_word(`ANSWER_START + i*4) !== GOLDEN[i]) begin
        $display("DM['h%4h] = %h, expect = %h", `ANSWER_START + i*4, `mem_word(`ANSWER_START + i*4), GOLDEN[i]);
        err = err + 1;
      end
      else begin
        $display("DM['h%4h] = %h, pass", `ANSWER_START + i*4, `mem_word(`ANSWER_START + i*4));
      end
    end
    // Task to print result
    result(err, num);
    $finish;
  end
  always @(inst_IF or rst) begin
    // $display("PC: 0x%h",current_pc);
    // $display("Instruction: 0x%h",inst_IF);
    // $display("===================================================");
    if(!rst) inst_num = inst_num + 1;
  end
  // Print result
  task result;
    input integer err;
    input integer num;
    begin
      $display("============================");
      if(err == 0) $display("No error found in this test.");
      else $display("Total %d errors.", err);
      $display("============================");
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
      $display("Total %d instructions executed.", inst_num);
      $display("----------------------");
      $display(" Simulation  finished ");
      $display("----------------------");
      $finish;
    end
  endtask
  // Max Cycle reached
  initial begin
    #(`CYCLE*`MAX)
    $display("Cycle reached %d, test failed.", `CYCLE*`MAX);
    err = 0;
    for (i = 0; i < num; i = i + 1)
    begin
      if (`mem_word(`ANSWER_START + i*4) !== GOLDEN[i])
      begin
        $display("DM['h%4h] = %h, expect = %h", `ANSWER_START + i*4, `mem_word(`ANSWER_START + i*4), GOLDEN[i]);
        err = err + 1;
      end
      else
      begin
        $display("DM['h%4h] = %h, pass", `ANSWER_START + i*4, `mem_word(`ANSWER_START + i*4));
      end
    end
    // Task to print result
    result(err, num);
    $finish;
  end
  // Dump waveform
  // initial begin
  //   $dumpfile("RISCV.fsdb");
  //   $dumpvars;
  // end
endmodule