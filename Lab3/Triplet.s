.equ N 4

.data
A: .word 1,2,3,-4,-5,-6,-7,-8,-9,-10,-11,-12
newline: .string "\n"

.bss
B: .word 0, 0, 0

.text
.globl main

jal main
li a0,0
li a7,93
ecall


res_triplet:
    addi sp, sp, -32
    sw s1, 0(sp)
    sw s2, 4(sp)
    sw s3, 8(sp)
    
    mv s1, zero
    mv t2, zero
    mv t3, zero
    mv t4, zero
    
    loop2:
        beq s1, a4, endloop2
        lw t1, 0(a0)
        add t3,t2,t1
        
        mv t2, t3
        addi s1, s1, 1
        addi a0, a0,4
        j loop2
        
    endloop2:
    bge t2,zero,8
    sub t2, zero,t2
    
    mv a0, t2
    lw s1, 0(sp)
    lw s2, 4(sp)
    lw s3, 8(sp)
    addi sp, sp, 32
    ret
        
    
main:
    addi sp, sp, -16
    sw ra, 0(sp)

    la a0, A
    la a1, B
    addi a2, zero, N
    addi a3, zero, 12 #3xN
    addi a4, zero, 3
    mv t1, zero
    loop1:
        beq t1, a3, endloop1 
        sw t1, 4(sp)
        sw a0, 0(s2)
        jal res_triplet
        sw a0, 0(a1)
        lw t1, 4(sp)
        
        li a7, 1
        ecall
        la a0, newline
        li a7, 4
        ecall        
        
        addi t1,t1, 3 #j=j+3
        #sw a0, 0(a1)     
        lw a0, 0(s2)
        addi a0, a0, 12
        addi a1, a1, 4
        j loop1
    endloop1:
        
    li a0 0
    lw ra, 0(sp)
    addi sp, sp, 16
    ret
    