setup:
  addi ra, x0, -1
  lui sp, 0x7ffff
  addi sp, sp, -16
main:
  beq x27, x1, exit
  addi x2, x0, 16
  slli x3, x1, 3
  xori x4, x2, -1
  slti x5, x2, -3
  sltiu x6, x2, -3
  srli x7, x3, 2
  srai x8, x3, 2
  ori x9, x0, 123
  andi x10, x5, -1
  add x11, x5, x6
  sub x12, x3, x7
  sll x13, x5, x8
  slt x14, x7, x9
  sltu x15, x9, x2
  xor x16, x11, x3
  srl x17, x13, x4
  sra x18, x15, x5
  or x19, x17, x1
  and x20, x13, x10
  sb x3, 3(x0)
  sw x1, 4(x0)
  lb x21, 3(x0)
  lw x22, 4(x0)
  lbu x23, 3(x0)
  lui x24, 0x1238
  beq x1, x2, exit
  bne x1, x1, exit
  blt x0, x1, exit
  bge x3, x0, exit
  bltu x3, x11, exit
  bgeu x11, x3, exit
Label:
  jal x25, branch1
branch6:
  bgeu x3, x11, Jump
  beq x0, x0, exit
branch5:
  bltu x11, x3, branch6
  beq x0, x0, exit
branch4:
  bge x0, x3, branch5
  beq x0, x0, exit
branch3:
  blt x1, x0, branch4
  beq x0, x0, exit
branch2:
  bne x1, x2, branch3
  beq x0, x0, exit
branch1:
  beq x1, x1, branch2
  beq x0, x0, exit
Jump:
  addi x27, x0, -1
  jalr x26, x0, 12
  beq x0, x0, Label
exit:
  addi ra, x0, -1
  jalr x0, x1, 0