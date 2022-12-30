.data
num_test: .word 5
test1: .word 1
test2: .word 0
test3: .word 10
test4: .word 15
test5: .word 20
store: .word 0x9000

.text
.globl main

.text
main:
  # answer is 1, 0, 55, 610, 6765 
  ####
  # t0: test data input address
  # t1: temp value / output value
  # t2: counter for test cases
  # t3: store address
  # a0: input value
  ####
  # Callee Saved
  addi sp, sp, -4     ## sp = @sp - 4
  sw ra, 0(sp)        ## ra -> MEM[@sp-4]
  # Initialize
  li t2, 0            ## t2 = 0
  la t3, store        ##  = store
  lw t3, 0(t3)        ## t3 <- MEM[store]
  # Load test data address and value
  la t0, test1        ## t0 = @test1
caseLoop:
  la t1, num_test     ## t1 = @num_test
  lw t1, 0(t1)        ## t1 = 5
  bge t2, t1, end     ## if t2 >= 5, end
  # Caller Saved
  addi sp, sp, -12    ## sp = @sp-16
  sw t0, 0(sp)        ## t0 -> MEM[@sp-16]
  sw t2, 4(sp)        ## t2 -> MEM[@sp-12]
  sw t3, 8(sp)        ## t3 -> MEM[@sp-8]
  # Call fibonacci function
  lw a0, 0(t0)        ## a0 <- MEM[t0]
  li a1, 0
  jal ra, fibonacci
  sw t0, 0(t3)        ## t0 -> MEM[t3]
  # Retrieve Caller Saved
  lw t0, 0(sp)        ## t0 <- MEM[@sp-16]
  lw t2, 4(sp)        ## t2 <- MEM[@sp-12]
  lw t3, 8(sp)        ## t3 <- MEM[@sp-8]
  addi sp, sp, 12      ## sp = @sp
  # Update address and counter
  addi t0, t0, 4      ## s2 += 4
  addi t2, t2, 1      ## t2 += 1
  addi t3, t3, 4      ## t3 += 4
  beq x0, x0, caseLoop
end:
  lw ra, 0(sp)        ## ra = @ra
  addi sp, sp, 4      ## sp = @sp
  ret
## fibonacci function
fibonacci:
  ####
  # t0: temp return value
  # t1: value 1
  # a0: input value
  # a1: output value
  ####
  
  # Check if input is 0 or 1
  # If input is 0 or 1, return
  beq a0, x0, retLabel  ## if n == 0, return
  li t1, 1              ## t1 = 1
  beq a0, t1, retOne    ## if n == 1, return 1
  # Else, call fibonacci function recursively
  ## n-1
  # Caller Saved
  addi sp, sp, -8       ## sp = @sp - 8
  sw a0, 0(sp)          ## a0 -> MEM[@sp - 8]
  sw ra, 4(sp)          ## ra -> MEM[@sp - 4]
  addi a0, a0, -1       ## a0 = n - 1
  jal ra, fibonacci     ## call fibonacci function
  # Retrieve Caller Saved
  add a1, a1, t0        ## a1 += t0
  lw a0, 0(sp)          ## a0 = @a0
  lw ra, 4(sp)          ## ra = @ra
  addi sp, sp, 8        ## sp = @sp
  ## n-2
  # Caller Saved
  addi sp, sp, -8       ## sp = @sp - 8
  sw a0, 0(sp)          ## a0 -> MEM[@sp - 8]
  sw ra, 4(sp)          ## ra -> MEM[@sp - 4]
  addi a0, a0, -2       ## a0 = n - 2
  jal ra, fibonacci     ## call fibonacci function
  # Retrieve Caller Saved
  add a1, a1, t0        ## a1 += t0
  lw a0, 0(sp)          ## a0 = @a0
  lw ra, 4(sp)          ## ra = @ra
  addi sp, sp, 8        ## sp = @sp
  # return fibonacci(n-1)+fibonacci(n-2)
  mv t0, a1             ## t0 = a1
  mv a1, x0             ## reset a1
  ret
retOne:
  li t0, 1              ## t0 = 1
  ret
retLabel:
  li t0, 0              ## t0 = 0
  ret
