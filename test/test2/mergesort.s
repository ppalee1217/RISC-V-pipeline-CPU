.data
num_test: .word 3 
TEST1_SIZE: .word 34
TEST2_SIZE: .word 19
TEST3_SIZE: .word 29
test1: .word 3,41,18,8,40,6,45,1,18,10,24,46,37,23,43,12,3,37,0,15,11,49,47,27,23,30,16,10,45,39,1,23,40,38
test2: .word -3,-23,-22,-6,-21,-19,-1,0,-2,-47,-17,-46,-6,-30,-50,-13,-47,-9,-50
test3: .word -46,0,-29,-2,23,-46,46,9,-18,-23,35,-37,3,-24,-18,22,0,15,-43,-16,-17,-42,-49,-29,19,-44,0,-18,23
test1_Addr: .word 0x9000
test2_Addr: .word 0x9088
test3_Addr: .word 0x90d4

.text
setup:
    li    ra, -1
    li    sp, 0xfff0
main:
    ####
    # s6: test data input address
    # s7: test data size
    # s8: test data result address
    ####
    
    # Caller Saved
    addi sp, sp, -16        # sp = @sp -16
    sw ra, 0(sp)
    sw s6, 4(sp)
    sw s7, 8(sp)
    sw s8, 12(sp)
    # Get test data 1
    la s6, test1            # s6 = @test1
    la s7, TEST1_SIZE       # s7 = @TEST1_SIZE 
    lw s7, 0(s7)            # s7 = test1 data size
    addi s7, s7, -1         # end index = SIZE -1
    la s8, test1_Addr       # s8 = @test1_Addr
    lw s8, 0(s8)            # s8 = test1 address
    # Call callMergeSort
    jal ra, callMergeSort
    # Get test data 2
    la s6, test2            # s6 = @test2
    la s7, TEST2_SIZE       # s7 = @TEST2_SIZE 
    lw s7, 0(s7)            # s7 = test2 data size
    addi s7, s7, -1         # end index = SIZE -1
    la s8, test2_Addr       # s8 = @test2_Addr
    lw s8, 0(s8)            # s8 = test2 address
    # Call callMergeSort
    jal ra, callMergeSort
    # Get test data 3
    la s6, test3            # s6 = @test3
    la s7, TEST3_SIZE       # s7 = @TEST3_SIZE 
    lw s7, 0(s7)            # s7 = test3 data size
    addi s7, s7, -1         # end index = SIZE -1
    la s8, test3_Addr       # s8 = @test3_Addr
    lw s8, 0(s8)            # s8 = test3 address
    # Call callMergeSort
    jal ra, callMergeSort
    # Retrieve ra
    lw ra, 0(sp)            # ra <- MEM[@sp-16]
    lw s6, 4(sp)            # s6 <- MEM[@sp-12]
    lw s7, 8(sp)            # s7 <- MEM[@sp-8]
    lw s8, 12(sp)           # s8 <- MEM[@sp-4]
    addi sp, sp, 16
    ret
    
callMergeSort:
    ####
    # s0: array address
    # s1: end index
    # s2: result address
    ####

    # Callee Saved
    addi sp, sp, -16        # sp = @sp -16
    sw s0, 0(sp)            # s0 -> MEM[@sp-16]
    sw s1, 4(sp)            # s1 -> MEM[@sp-12]
    sw s2, 8(sp)            # s2 -> MEM[@sp-8]
    sw ra, 12(sp)           # ra -> MEM[@sp-4]
    # Load test data
    mv s0, s6               # s0 = test input address
    mv s1, s7               # s1 = @TEST_SIZE 
    mv s2, s8               # s2 = test result address
    # Pass parameters
    mv a5, s0               # array address = s0
    mv a1, x0               # start index = 0
    mv a2, s1               # end index = s1
    mv a4, s2               # result address = s2
    # Jump to mergeSort
    li s9, 0                # s9: reset k = 0
    jal ra, mergeSort       # ra = Addr(lw s0, 0(sp))
    # Retrieve data
    lw s0, 0(sp)            # s0 = @s0
    lw s1, 4(sp)            # s1 = @s1
    lw s2, 8(sp)            # s2 = @s2
    lw ra, 12(sp)           # ra = @ra
    addi sp, sp, 16         # sp = @sp
    
    ret

mergeSort:
    ####
    # s0: array address
    # s1: result address
    # t0: start index
    # t1: end index
    # t2: mid = left_max
    # t3: mid index + 1 = right array init
    # t4: i = start index
    # t5: j = left_max + 1
    # s9: k (for result array)
    ####
    
    # Check if start < end
    bge a1, a2, returnLabel
    # Load parameters
    mv s0, a5               # s0 = array address
    mv s1, a4               # s1 = result address
    mv t0, a1               # t0 = start index
    mv t1, a2               # t1 = end index
    add t2, t0, t1          # t2 = start index + end index
    srai t2, t2, 1          # t2 = (start + end) / 2
    addi t3, t2, 1          # t3: mid index + 1 = right array init
    mv t4, t0               # t4: i = start index
    addi t5, t2, 1          # t5: j = left_max + 1
    # Callee Saved
    addi sp, sp, -8         # sp = @sp - 8
    sw s0, 4(sp)            # s0 -> MEM[@sp-4]
    sw ra, 0(sp)            # ra -> MEM[@sp-8]
    # Caller Saved
    addi sp, sp, -28        # sp = @sp - 36
    sw t0, 0(sp)            # t0 -> MEM[@sp-36]
    sw t1, 4(sp)            # t1 -> MEM[@sp-32]
    sw t2, 8(sp)            # t2 -> MEM[@sp-28]
    sw t3, 12(sp)           # t2 -> MEM[@sp-24]
    sw t4, 16(sp)           # t2 -> MEM[@sp-20]
    sw t5, 20(sp)           # t2 -> MEM[@sp-16]
    sw s9, 24(sp)           # t2 -> MEM[@sp-12]
    # Call mergeSort first time
    ## Pass paremeters
    mv a1, t0               # pass start = start
    mv a2, t2               # pass end = mid
    ## Call function
    jal ra, mergeSort       # ra = Addr(lw t0, 0(sp))
    ## Retrieve caller saved data
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    
    # Call mergeSort second time
    ## Pass paremeters
    addi t2, t2, 1          # mid++
    mv a1, t2               # pass start = mid + 1
    mv a2, t1               # pass end = end
    ## Call function
    jal ra, mergeSort       # ra = Addr(lw t0, 0(sp))
    ## Retrieve caller saved data
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 12(sp)
    lw t4, 16(sp)
    lw t5, 20(sp)
    lw s9, 24(sp)
    # Call merge
    ## Pass paremeters
    mv a0, s0               # pass array address
    mv a1, t0               # pass start index
    mv a2, t2               # pass mid index
    mv a4, s1               # pass result address
    mv a3, t1               # pass end index
    li s2, 0x7500       # pass temp array address
    ## Call function
    jal ra, merge           # ra = Addr(lw ra, 28(sp))
    
    # Retrieve ra and s0
    lw ra, 28(sp)           # ra = @ra
    lw s0, 32(sp)           # s0 = @s0
    addi sp, sp, 36         # sp = @sp
    
    ret
returnLabel:
    ret
merge:
    ## temp array store data in 0x00007500
    ####
    # s0: init array address
    # s1: result address
    # s2: temp array address
    # s3: temp parameter
    # t0: start index
    # t1: mid index = left_max
    # t2: end index
    # t3: mid index + 1 = right array init
    # t4: i = start index
    # t5: j = left_max + 1
    # s9: k (for result array) (remain the same during whole mergesort)
    ####
    
    # Callee Saved
    addi sp, sp, -16            # sp = @sp - 16
    sw s0, 0(sp)                # s0 -> MEM[@sp-16]
    sw s1, 4(sp)                # s1 -> MEM[@sp-12]
    sw s2, 8(sp)                # s2 -> MEM[@sp-8]
    sw s3, 12(sp)               # s3 -> MEM[@sp-4]
    # Get parameter
    mv s0, a0                   # s0: init array address
    mv t0, a1                   # t0: start index
    mv t1, a2                   # t1: mid index = left_max
    mv t2, a3                   # t2: end index
    addi t3, t1, 1              # t3: mid index + 1 = right array init
    mv t4, t0                   # t4: i = start index
    addi t5, t1, 1              # t5: j = left_max + 1
    mv s1, a4                   # s1: result address
    # Caller Saved
    addi sp, sp, -28            # sp = @sp - 44
    sw t0, 0(sp)                # t0 -> MEM[@sp-44]
    sw t1, 4(sp)                # t1 -> MEM[@sp-40]
    sw t2, 8(sp)                # t2 -> MEM[@sp-36]
    sw t3, 12(sp)               # t3 -> MEM[@sp-32]
    sw t4, 16(sp)               # t4 -> MEM[@sp-28]
    sw t5, 20(sp)               # t5 -> MEM[@sp-24]
    sw ra, 24(sp)               # ra -> MEM[@sp-20]
    # Create temp array
    mv t3, t0
    jal ra, passArray           # ra = Addr(lw t3, 12(sp))
    # Reterieve parameter
    lw s1, 32(sp)
    lw t5, 20(sp)
    lw t3, 12(sp)
    lw t0, 0(sp)                # t0: start index
    mv t4, t0                   # t4: i = start index
    # Loop to compare two array
    lw s0, 28(sp)               # s0 = @s0
    jal ra, compareLoop
    # Retrieve address
    lw s0, 28(sp)               # s0 = @s0
    lw s1, 32(sp)               # s1 = @s1
    lw s2, 36(sp)               # s2 = @s2
    # Loop to check unranged array
    addi s3, t4, -1             # s3 = i - 1
    jal ra, leftMove            # ra = Addr(addi s3, t5, -1)
    addi s3, t5, -1             # s3 = j - 1
    jal ra, rightMove           # ra = Addr(lw t0, 0(sp))
    # Retrieve data
    lw t0, 0(sp)                # t0 = @t0
    lw t1, 4(sp)                # t1 = @t1
    lw t2, 8(sp)                # t2 = @t2
    lw t3, 12(sp)               # t3 = @t3
    lw t4, 16(sp)               # t4 = @t4
    lw t5, 20(sp)               # t5 = @t5
    lw ra, 24(sp)               # ra = @ra
    lw s0, 28(sp)               # s0 = @s0
    lw s1, 32(sp)               # s1 = @s1
    lw s2, 36(sp)               # s2 = @s2
    lw s3, 40(sp)               # s3 = @s3
    addi sp, sp, 44             # sp = @sp
    
    ret
    
compareLoop:
    ####
    # s1: result address (can change during loop)
    # s2: temp array address (can change during loop)
    # s3: loop parameter for memory moving
    # s4: temp[i]
    # s5: temp[j]
    # t0: start index
    # t1: mid index = left_max
    # t2: end index
    # t3: mid index + 1 = right array init
    # t4: i = start index (for left temp array)
    # t5: j = left_max + 1 (for right temp array)
    # s9: k (for result array) (remain the same during whole mergesort)
    ####
    
    ## Use a temp reg as 0, call changeArrayPos to adjust the
    ## memory of both s1 & s2 to indicated position
    
    # Callee Saved
    addi sp, sp, -16             # sp = @sp - 16
    sw s3, 0(sp)                 # s3 -> MEM[@sp-16]
    sw s4, 4(sp)                 # s4 -> MEM[@sp-12]
    sw s5, 8(sp)                 # s5 -> MEM[@sp-8]
    sw ra, 12(sp)                # ra -> MEM[@sp-4]
    # Caller Saved
    addi sp, sp, -16             # sp = @sp - 32
    sw t0, 0(sp)                 # t0 -> MEM[@sp-32]
    sw t1, 4(sp)                 # t1 -> MEM[@sp-28]
    sw t2, 8(sp)                 # t2 -> MEM[@sp-24]
    sw t3, 12(sp)                # t3 -> MEM[@sp-20]
    # Check if needs to return
    addi s3, t4, -1              # s3 = i - 1
    bge s3, t1, returnAndRecover # if i > left_max, return
    addi s3, t5, -1              # s3 = j - 1
    bge s3, t2, returnAndRecover # if j > right_max, return
    # Get temp[i]
    li s3, 0                     # Reset temp index to 0
    mv a2, t4                    # pass index to move
    mv a3, s2                    # pass move address
    jal ra, changeArrayPos       # ra = Addr(lw s4, 0(a2))
    lw s4, 0(a2)                 # Store return value to temp[i]
    # Get temp [j]
    li s3, 0                     # Reset temp index to 0
    mv a2, t5                    # pass index to move
    mv a3, s2                    # pass move address
    jal ra, changeArrayPos       # ra = Addr(lw s5, 0(a2))
    lw s5, 0(a2)                 # Store return value to temp[j]
    # Retrieve saved
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 12(sp)
    # Check if temp[i] < temp[j] ? call functIf : call functElse
    jal ra, chooseIfElse
    lw ra, 28(sp)                # ra = @ra
    # Retrieve saved
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    addi sp, sp, 32             # sp = @sp
    # Conti loop
    beq x0, x0, compareLoop
returnAndRecover:
    # Retrieve saved
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    lw ra, 28(sp)               # ra = @ra
    addi sp, sp, 32             # sp = @sp
    ret
chooseIfElse:
    blt s4, s5, functIf
    bge s4, s5, functElse
    
functIf:
    # Store ra
    addi sp, sp, -4             # sp = @sp - 4
    sw ra, 0(sp)                # ra -> MEM[@sp-4]
    # Store temp[i] to array[k]
    li s3, 0                    # Reset temp index to 0
    mv a2, s9                   # pass index to move (k)
    mv a3, s1                   # pass move address (array)
    jal ra, changeArrayPos      # ra = Addr(sw s4, 0(a2))
    sw s4, 0(a2)                # save the value of temp[i] to array[k]
    # k++ & i++
    addi s9, s9, 1              # k++
    addi t4, t4, 1              # i++
    # Retrieve ra
    lw ra, 0(sp)                # ra = @ra
    addi sp, sp, 4              # sp = @sp
    ret
    
functElse:
    # Store ra
    addi sp, sp, -4             # sp = @sp - 4
    sw ra, 0(sp)                # ra -> MEM[@sp-4]
    # Store temp[j] to array[k]
    li s3, 0                    # Reset temp index to 0
    mv a2, s9                   # pass index to move (k)
    mv a3, s1                   # pass move address (array)
    jal ra, changeArrayPos      # ra = Addr(sw s4, 0(a2))
    sw s5, 0(a2)                # save the value of temp[j] to array[k]
    # k++ & j++
    addi s9, s9, 1              # k++
    addi t5, t5, 1              # j++
    # Retrieve ra
    lw ra, 0(sp)                # ra = @ra
    addi sp, sp, 4              # sp = @sp
    ret
    
changeArrayPos:
    ####
    # s3: Loop parameter for memory adjusting (init is 0)
    # a2: Index to goto / return address
    # a3: The address of moving array
    ####
    bge s3, a2, returnAndStore  # Check if loop is over
    # Add address until the indicated index position
    addi a3, a3, 4
    addi s3, s3, 1
    blt s3, a2, changeArrayPos
    # Store return value address
    mv a2, a3                   # return value
    ret
returnAndStore:
    # Store return value address
    mv a2, a3                   # return value
    ret
leftMove:
    bge s3, t1, returnLabel     # if i > left_max, return
    # Caller Saved
    addi sp, sp, -8             # sp = @sp - 8
    sw ra, 0(sp)                # ra -> MEM[@sp-8]
    sw s3, 4(sp)                # s3 -> MEM[@sp-4]
    # Get temp[i]
    li s3, 0                    # Reset temp index to 0
    mv a2, t4                   # pass index to move
    mv a3, s2                   # pass move address
    jal ra, changeArrayPos      # ra = Addr(lw s4, 0(a2))
    lw s4, 0(a2)                # Store return value to temp[i]
    # Call functIf
    jal ra, functIf
    addi s3, t4, -1             # s3 = i - 1
    # Chake if loop conti
    bge s3, t1, returnRetrieve  # if i <= left_max
    # Retrieve ra
    lw ra, 0(sp)                # ra = @ra
    lw s3, 4(sp)                # s3 = @s3
    addi sp, sp, 8              # sp = @sp
    beq x0, x0, leftMove
    
rightMove:
    bge s3, t2, returnLabel     # if j > right_max, return
    # Caller Saved
    addi sp, sp, -8             # sp = @sp - 8
    sw ra, 0(sp)                # ra -> MEM[@sp-8]
    sw s3, 4(sp)                # s3 -> MEM[@sp-4]
    # Get temp[i]
    li s3, 0                    # Reset temp index to 0
    mv a2, t5                   # pass index to move
    mv a3, s2                   # pass move address
    jal ra, changeArrayPos      # ra = Addr(lw s4, 0(a2))
    lw s5, 0(a2)                # Store return value to temp[j]
    # Call functElse
    jal ra, functElse
    addi s3, t5, -1             # s3 = j - 1
    # Chake if loop conti
    bge s3, t2, returnRetrieve  # if j <= right_max
    # Retrieve ra
    lw ra, 0(sp)                # ra = @ra
    lw s3, 4(sp)                # s3 = @s3
    addi sp, sp, 8              # sp = @sp
    beq x0, x0, rightMove
    
returnRetrieve:
    lw ra, 0(sp)                # ra = @ra
    lw s3, 4(sp)                # s3 = @s3
    addi sp, sp, 8              # sp = @sp
    ret
    
passArray:
    ## if start == mid || end == mid + 1 -> pass init array
    ## which means this index is divided to one only
    ## else, pass result array
    ####
    # t0: start index
    # t1: mid index
    # t2: end index
    # s0: init array address
    # s1: temp array address
    # s2: result array address
    ####
    
    # Caller Saved
    addi sp, sp, -12               # sp = @sp - 12
    sw ra, 0(sp)                   # ra -> MEM[@sp-12]
    sw s3, 4(sp)                   # s3 -> MEM[@sp-8]
    sw s2, 8(sp)                   # s2 -> MEM[@sp-4]
    # Pass array
    mv s2, s1                      # s2 = result array address
    ## start ~ mid
    mv a1, t0
    mv a2, t1
    li s1 0x7500               # Let temp address = 0x7500 
    jal ra, passInit               # ra = Addr(jal ra, passResult)
    jal ra, passResult             # ra = Addr(addi t4, t1, 1)
    addi t4, t1, 1                 # let t4 = mid + 1
    ## mid + 1 ~ end
    mv a1, t4
    mv a2, t2
    li s1 0x7500               # Let temp address = 0x7500 
    jal ra, passInit               # ra = Addr(jal ra, passResult)
    jal ra, passResult             # ra = Addr(ret)
    # Retrieve ra
    lw ra, 0(sp)                   # ra = @ra
    lw s3, 4(sp)                   # s3 = @s3
    lw s2, 8(sp)                   # s2 = @s2
    addi sp, sp, 12                # sp = @sp
    ret

passInit:
    ####
    # a1: pass index
    # s0: init array address
    # s1: temp array address
    # t3: i = 0 / value
    # t4: temporary address of indicated index in init array
    ####
    
    blt a1, a2, returnLabel        # if start != mid, return
    # Callee Saved
    addi sp, sp, -4                # sp = @sp - 4
    sw ra, 0(sp)                   # ra -> MEM[@sp-4]
    # Adjust memory position
    li t3, 0                       # t3 = i =0
    mv t4, s0
    jal ra, addMemory              # ra = Addr(lw t3, 0(t4))
    #blt t3, a1, addMemory          # if i < pass index, adjust memory
    lw t3, 0(t4)                   # load saved word from t4
    sw t3, 0(s1)                   # save to temp address
    # Retrieve ra
    lw ra, 0(sp)                   # ra = @ra
    addi sp, sp, 4                 # sp = @sp
    ret
    
passResult:
    ####
    # a1: leftmost index
    # a2: rightmost index
    # s1: temp array address
    # s2: result array address
    # t3: i = 0 / value
    # t4: temporary address of indicated index in result array
    ####
    
    bge a1, a2, returnLabel        # if start >= mid, ret
    # Callee Saved
    addi sp, sp, -4                # sp = @sp - 4
    sw ra, 0(sp)                   # ra -> MEM[@sp-4]
    # Adjust memory position
    li t3, 0                       # let t3 = i = 0
    mv t4, s2
    jal ra, addMemory              # ra = Addr(mv t3, a1)
    #blt t3, a1, addMemory         # if i < leftmost index, adjust memory
    # Pass portions of result array
    mv t3, a1                      # t3 = leftmost index
    addi t3, t3, -1                # t3 = leftmost index - 1
    jal ra, passPortion            # ra = Addr(lw ra, 0(sp))
    # Retrieve ra
    lw ra, 0(sp)                   # ra = @ra
    addi sp, sp, 4                 # sp = @sp
    ret
    
addMemory:
    bge t3, a1, returnLabel
    addi s1, s1, 4                 # temp array address + 4
    addi t4, t4, 4                 # pass array address + 4
    addi t3, t3, 1                 # i++
    blt t3, a1, addMemory          # if i < leftmost / pass index
                                   # loop conti
    ret
    
passPortion:
    lw t5, 0(t4)                   # load saved word from t4
    sw t5, 0(s1)                   # save to temp address
    addi s1, s1, 4
    addi t4, t4, 4
    addi t3, t3, 1
    blt t3, a2, passPortion        # conti loop until i < rightmost index
    ret