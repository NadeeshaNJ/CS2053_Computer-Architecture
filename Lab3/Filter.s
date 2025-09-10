.equ N 6

.data
A: .word 48,64,56,80,96,48
newline: .string "\n"

.bss
B: .word 0,0,0,0,0

.text
.globl main

jal main
li a0,0
li a7,93
ecall


myFilter:
    addi sp, sp, -32
    sw s1, 0(sp)
    sw s2, 4(sp)
    sw s3, 8(sp)
    
    lw s1, 0(s0)
    lw s2, 4(s0)
    andi s3,s1,0b1111 
    mv a0, zero
    
    bne s3, zero, jump3 
    blt s2, s1, jump3
    
    
    addi a0,a0,1
    jump3:
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
    addi a3, zero, 5 #N-1
    addi a4, zero, 2
    mv a5, zero
    mv s0, a0
    mv s1, a1
    mv s4, zero
    loop1:
        beq t1, a3, endloop1 
        sw t1, 4(sp)
        sw a0, 8(sp)
        sw a1, 12(sp)
        sw a3, 16(sp)
        sw s1, 20(sp)
        jal myFilter
        
        beq a0,zero, jump2        
        lw s1, 0(s0)
        lw s2, 4(s0)
        add a5, s1,s2
        addi a0, a5, 2
        
        sw a0, 0(a1)
        addi a1, a1, 4
        sw a1, 12(sp)
        
        li a7, 1
        ecall
        la a0, newline
        li a7, 4
        ecall  
        jump2:        
        lw t1, 4(sp)
        lw a0, 8(sp)
        lw a1, 12(sp)
        lw a3, 16(sp)
        lw s1, 20(sp)
        addi t1,t1, 1 
        addi s0, s0, 4
        addi s1, s1, 4
        
        j loop1
    endloop1:
        
    li a0 0
    lw ra, 0(sp)
    addi sp, sp, 16
    ret
    