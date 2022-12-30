.data
test1: .word 16,2,4,16,4,10,12,2,14,8,4,14,6,4,2,10,12,6,10,2,14,14,6,8,16,8,16,6,12,10,8,123
test2: .word 470,405,225,197,126,122,56,33,-81,-275,-379,-409,-416,-496,-500
test3: .word 412,-474,443,171,-23,247,221,7,40,221,-90,61,-9,49,-80,-80,221,-379,-161,-397,-173,276,-197,221,-12,-145,101

TEST1_SIZE: .word 32
TEST2_SIZE: .word 15
TEST3_SIZE: .word 27


.text
.globl main
    li ra, -1
main:
    addi sp, sp, -4
    sw s0, 0(sp)
    li s0, 0x9000
    
    ###
    # s0 : TEST_SIZE
    # s1 : array address 
    # t0 : result
    
    ###
    
    
    ### Test1
    
    ## Callee saved
    addi sp, sp, -8         # sp = @sp - 8
    sw s0, 4(sp)            # s0 -> MEM[@sp-4]
    sw s1, 0(sp)            # s1 -> MEM[@sp-8]
    ##
    
    # Get TEST_SIZE & Array Address
    la s0, TEST1_SIZE
    lw s0, 0(s0)            # s0 = 32(TEST1_SIZE)
    la s1, test1            # s1 = address of array1
     
    ## Call MergeSort
    # Caller saved
    addi sp, sp, -4         # sp = @sp - 12
    sw ra, 0(sp)            # ra -> MEM[@sp-12]
    
    # Parameter passing
    mv a0, s1               # a0 = array address
    li a1, 0                # a1 = 0 (start = 0)
    addi a2, s0, -1         # a2 = TEST_SIZE-1 (end)
    
    # Jump to MergeSort
    jal ra, MergeSort
    
    # Get return value
    mv t0, a0
    
    # Retrieve ra & Callee saved data
    lw ra, 0(sp)            # ra = @ra
    lw s1, 4(sp)            # s1 = @s1
    lw s0, 8(sp)            # s0 = @s0
    addi sp, sp, 12         # sp = @sp -8
    
    ### Test2
    
    ## Callee saved
    addi sp, sp, -8         # sp = @sp - 8
    sw s0, 4(sp)            # s0 -> MEM[@sp-4]
    sw s1, 0(sp)            # s1 -> MEM[@sp-8]
    ##
    
    # Get TEST_SIZE & Array Address
    la s0, TEST2_SIZE
    lw s0, 0(s0)            # s0 = 32(TEST1_SIZE)
    la s1, test2            # s1 = address of array1
     
    ## Call MergeSort
    # Caller saved
    addi sp, sp, -4         # sp = @sp - 12
    sw ra, 0(sp)            # ra -> MEM[@sp-12]
    
    # Parameter passing
    mv a0, s1               # a0 = array address
    li a1, 0                # a1 = 0 (start = 0)
    addi a2, s0, -1         # a2 = TEST_SIZE-1 (end)
    
    # Jump to MergeSort
    jal ra, MergeSort
    
    # Get return value
    mv t0, a0
    
    # Retrieve ra & Callee saved data
    lw ra, 0(sp)            # ra = @ra
    lw s1, 4(sp)            # s1 = @s1
    lw s0, 8(sp)            # s0 = @s0
    addi sp, sp, 12         # sp = @sp -8
    
    ### Test3
    ## Callee saved
    addi sp, sp, -8         # sp = @sp - 8
    sw s0, 4(sp)            # s0 -> MEM[@sp-4]
    sw s1, 0(sp)            # s1 -> MEM[@sp-8]
    ##
    
    # Get TEST_SIZE & Array Address
    la s0, TEST3_SIZE
    lw s0, 0(s0)            # s0 = 32(TEST1_SIZE)
    la s1, test3            # s1 = address of array1
     
    ## Call MergeSort
    # Caller saved
    addi sp, sp, -4         # sp = @sp - 12
    sw ra, 0(sp)            # ra -> MEM[@sp-12]
    
    # Parameter passing
    mv a0, s1               # a0 = array address
    li a1, 0                # a1 = 0 (start = 0)
    addi a2, s0, -1         # a2 = TEST_SIZE-1 (end)
    
    # Jump to MergeSort
    jal ra, MergeSort
    
    # Get return value
    mv t0, a0
    
    
    
    # Retrieve ra & Callee saved data
    lw ra, 0(sp)            # ra = @ra
    lw s1, 4(sp)            # s1 = @s1
    lw s0, 8(sp)            # s0 = @s0
    addi sp, sp, 12         # sp = @sp -8
    
    # Move the answer to 0x9000
    la t0, test1            
    li t1, 0x9000
    li t2, 0                # i = 0
    la t3, TEST1_SIZE
    lw t3, 0(t3)            # t2 = size1
    bge t2, t3, endLoop1
Loop1:
    lw s0, 0(t0)            # s0 = data
    sw s0, 0(t1)
    addi t0, t0, 4
    addi t1, t1, 4
    addi t2, t2, 1
    blt t2, t3, Loop1
endLoop1:
    la t0, test2
    li t2, 0                # i = 0
    la t3, TEST2_SIZE
    lw t3, 0(t3)            # t2 = size3
    bge t2, t3, endLoop2
Loop2:
    lw s0, 0(t0)            # s0 = data
    sw s0, 0(t1)
    addi t0, t0, 4
    addi t1, t1, 4
    addi t2, t2, 1
    blt t2, t3, Loop2
endLoop2:
    la t0, test3
    li t2, 0                # i = 0
    la t3, TEST3_SIZE
    lw t3, 0(t3)            # t2 = size3
    bge t2, t3, endLoop3
Loop3:
    lw s0, 0(t0)            # s0 = data
    sw s0, 0(t1)
    addi t0, t0, 4
    addi t1, t1, 4
    addi t2, t2, 1
    blt t2, t3, Loop3
endLoop3:
    # main function return
main_exit:
    lw s0, 0(sp)
    addi sp, sp, 4
    ret
    
MergeSort:
    ###
    # t0 : array address
    # t1 : start
    # t2 : end
    # t3 : mid
    ###
    
    mv t0, a0
    
    mv t1, a1
    mv t2, a2
    
    bge t1, t2, END          # branch if start >= end
    add t3, t2, t1           # t3 = end + start
    srli t3, t3, 1           # mid = (end + start)/2
    
    ## Call MergeSort (arr, start, mid)
    # Caller saved
    addi sp, sp, -16
    sw ra, 0(sp)             # ra -> MEM[@sp-16]
    sw t1, 4(sp)             # t1 -> MEM[@sp-12] -> start
    sw t2, 8(sp)             # t2 -> MEM[@sp-8] -> end
    sw t3, 12(sp)            # t3 -> MEM[@sp-4] -> mid
    
    # Parameter Passing
    mv a0, t0
    mv a1, t1
    mv a2, t3
    
    # Jump to MergeSort
    jal ra, MergeSort
    
    # Return Caller saved (end, start and mid)
    lw t1, 4(sp)             # t2 = @end
    lw t2, 8(sp)             # t1 = @start
    lw t3, 12(sp)            # t3 = @mid
    
    # Retrieve ra and sp
    lw ra, 0(sp)             # ra = @ra
    addi sp, sp, 16           # sp =@sp
    ##
    
    ## Call MergeSort (arr, mid + 1, end)
    # Caller saved
    addi sp, sp, -16
    sw ra, 0(sp)             # ra -> MEM[@sp-16]
    sw t2, 4(sp)             # t2 -> MEM[@sp-12] -> end
    sw t3, 8(sp)             # t3 -> MEM[@sp-8] -> mid
    sw t1, 12(sp)            # t1 -> MEM[@sp-4] ->start
    addi t3, t3, 1          # t3 = mid + 1
    
    # Parameter passing
    mv a0, t0
    mv a1, t3
    mv a2, t2
    
    # Jump to MergeSort
    jal ra, MergeSort
    
    # Return Caller saved (end, start and mid)
    lw t2, 4(sp)             # t2 = @end
    lw t3, 8(sp)             # t3 = @start
    lw t1, 12(sp)            # t1 = @mid
    
    # Retrieve ra and sp
    lw ra, 0(sp)             # ra = @ra
    addi sp, sp, 16           # sp =@sp
    ##
    
    ## Call Merge (arr, start, mid, end)
    # Caller saved
    addi sp, sp, -16
    sw ra, 0(sp)             # ra -> MEM[@sp-16]
    sw t2, 4(sp)             # t2 -> MEM[@sp-12] -> end
    sw t3, 8(sp)             # t3 -> MEM[@sp-8] -> mid
    sw t1, 12(sp)            # t1 -> MEM[@sp-4] ->start
    
    # Parameter passing
    mv a0, t0
    mv a1, t1
    mv a2, t3
    mv a3, t2
    
    # Jump to Merge
    jal ra, Merge
    
    # Return Caller saved (end, start and mid)
    lw t2, 4(sp)             # t2 = @end
    lw t3, 8(sp)             # t1 = @start
    lw t1, 12(sp)            # t3 = @mid
    
    # Retrieve ra and sp
    lw ra, 0(sp)             # ra = @ra
    addi sp, sp, 16           # sp = @sp
    ##
    
END:
    ret                      # jalr x0, ra
    
Merge:
    ###
    # t0 : array address
    # t1 : start
    # t2 : end
    # t3 : mid
    # s2 : temp_size
    # s3 : temp address
    # s4 : left_index
    # s5 : right_index
    # s6 : left_max
    # s7 : right_max
    # s8 : arr_index
    # t4 : for loop i
    ###
    
    # Callee saved
    addi sp, sp, -32        # sp = @sp-32
    sw s3, 0(sp)            # s3 -> MEM[@sp-32]
    sw s2, 4(sp)            # s2 -> MEM[@sp-28]
    sw s4, 8(sp)            # s4 -> MEM[@sp-24]
    sw s5, 12(sp)           # s5 -> MEM[@sp-20]
    sw s6, 16(sp)           # s6 -> MEM[@sp-16]
    sw s7, 20(sp)           # s7 -> MEM[@sp-12]
    sw s8, 24(sp)           # s8 -> MEM[@sp-8]
    sw s9, 28(sp)           # s9 -> MEM[@sp-4]    
    
    
    # Get argument parameters
    mv t0, a0               # t0 = array address
    mv t1, a1               # t1 = start
    mv t3, a2               # t3 = mid
    mv t2, a3               # t2 = end
    
    sub s2, t2, t1          # s2 = end - start
    addi s2, s2, 1          # s2 = end - start + 1 -> temp_size
     
    
    # temp array stored in stack
    slli s2, s2, 2          # s2 = 4 * temp_size
    sub sp, sp, s2          # temp array with variable length stored in stack
    mv s3, sp               # s3 = temp address
    srli s2, s2, 2          # restore s2 to temp_size
    
    ## initialize temp array
    ###
    # t4 : i
    # t5 : address of arr[i + start]
    # t6 : address of temp[i]
    # s9 : immediate step for computation
    ###
    
    li t4, 0                # i = 0
    mv t5, t0               # t5 = array address
Loop:
    # condition check
    bge t4, s2, endLoop     # go to endLoop if i >= temp_size
    
    # Handle arr[i + start]
    add s9, t4, t1          # s9 = i + start
    slli s9, s9, 2          # s9 = 4 * (i + start)
    add t5, s9, t0          # t5 = address of arr[i + start]
    lw s9, 0(t5)            # s9 = value of arr[i + start]
    
    # Handle temp[i]
    slli t6, t4, 2          # t6 = i * 4
    add t6, t6, s3          # t6 = address of temp[i]
    sw s9, 0(t6)            # temp[i] = arr[i + start]
    # iteration
    addi t5, t5, 4          # t5 increment 1 element
    addi t4, t4, 1          # i++
    jal x0, Loop
    
endLoop:
    ## end of temp initialization
    
    # Some parameters initialization
    li s4, 0                # left_index = 0
    sub s5, t3, t1          # s5 = mid - start
    addi s5, s5, 1          # s5 = mid - start + 1 -> right_index
    sub s6, t3, t1          # s6 = left_max = mid - start
    sub s7, t2, t1          # s7 = right_max = end - start
    mv s8, t1               # s8 = arr_index = start
    
    # Start of while1
    # while1 (left_index <= left_max && right_index <= right_max)
    blt s6, s4, condition2  # go to condition2 if left_index > left_max
    blt s7, s5, condition2  # go to condition2 if right_index > right_max
    
    ### Parameters for computation and comparison
    ## t1 , t2 , t3 can be reused
    # t0 : address of initial array(arr)
    # t4 : address of temp[left_index]
    # t5 : address of temp[right_index]
    # t1 : address of arr[arr_index]
    # t6 : value of temp[left_index]
    # s9 : value of temp[right_index]
    ###
    
while1:
    ## if(temp[left_index] <= temp[right_index]) condition check
    
    # Get temp[left_index]
    slli t4, s4, 2         # t4 = left_index * 4
    add t4, t4, s3         # t4 = address of temp[left_index]
    lw t6, 0(t4)           # t6 = value of temp[left_index]
    
    # Get temp[right_index]
    slli t5, s5, 2         # t5 = right_index * 4
    add t5, t5, s3         # t5 = address of temp[right_index]
    lw s9, 0(t5)           # s9 = value of temp[right_index]
    
    blt s9, t6, else       # go to else label if temp[right_index] < temp[left_index] 
    
    ## arr[arr_index] = temp[left_index]
    # Get address of arr[arr_index]
    slli t1, s8, 2         # t1 = 4 * arr_index
    add t1, t1, t0         # t1 = address of arr[arr_index]
    
    sw t6, 0(t1)           # arr[arr_index] = temp[left_index]
    
    addi s8, s8, 1         # arr_index++
    addi s4, s4, 1         # left_index++
    jal x0, condition1     # if is done then jump to condition1
     
else:
    ## arr[arr_index] = temp[right_index]
    slli t1, s8, 2         # t1 = 4 * arr_index
    add t1, t1, t0         # t1 = address of arr[arr_index]
    
    sw s9, 0(t1)           # arr[arr_index] = temp[right_index]
    
    addi s8, s8, 1         # arr_index++
    addi s5, s5, 1         # right_index++
    
condition1:
    blt s6, s4, condition2 # if left_index > left_max keep go to condition2
    bge s7, s5, while1     # go to while1 if (right_max >= right_index)
    
    # Start of while2
    ## while(left_index <= left_max)
condition2:
    blt s6, s4, condition3     # go to condition3 if left_index > left_max 
    
while2:
    ## arr[arr_index] = temp[left_index]
    # Get address of arr[arr_index]
    slli t1, s8, 2         # t1 = 4 * arr_index
    add t1, t1, t0         # t1 = address of arr[arr_index]
    # Get temp[left_index]
    slli t4, s4, 2         # t4 = left_index * 4
    add t4, t4, s3         # t4 = address of temp[left_index]
    lw t6, 0(t4)           # t6 = value of temp[left_index]
    
    sw t6, 0(t1)           # arr[arr_index] = temp[left_index]
    
    addi s8, s8, 1         # arr_index++
    addi s4, s4, 1         # left_index++
    bge s6, s4, while2     # go to while2 if left_max >= left_index

    # Start of while3
    ## while(right_index <= right_max)
condition3:
    blt s7, s5, endMerge   # go to endMerge if right_max < right_index
    
while3:
    ## arr[arr_index] = temp[right_index]
    # Get address of arr[arr_index]
    slli t1, s8, 2         # t1 = 4 * arr_index
    add t1, t1, t0         # t1 = address of arr[arr_index]
    # Get temp[right_index]
    slli t5, s5, 2         # t5 = right_index * 4
    add t5, t5, s3         # t5 = address of temp[right_index]
    lw s9, 0(t5)           # s9 = value of temp[right_index]
    
    sw s9, 0(t1)           # arr[arr_index] = temp[right_index]
    
    addi s8, s8, 1         # arr_index++
    addi s5, s5, 1         # right_index++
    bge s7, s5, while3     # go to while3 if right_max >= right_index
    
endMerge:  
    # Return stack space for storing temp
    slli s2, s2, 2         # s2 = temp_size * 4
    add sp, sp, s2         
    
    # retrieve Callee saved
    lw s3, 0(sp)           # s3 = @s3
    lw s2, 4(sp)           # s2 = @s2
    lw s4, 8(sp)           # s4 = @s4
    lw s5, 12(sp)          # s5 = @s5
    lw s6, 16(sp)          # s6 = @s6
    lw s7, 20(sp)          # s7 = @s7
    lw s8, 24(sp)          # s8 = @s8
    lw s9, 28(sp)          # s9 = @s9
    addi sp, sp, 32
    
    ret
    
    

    
    
    
    
    
    
    
    
    
