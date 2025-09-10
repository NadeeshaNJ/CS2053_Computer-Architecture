.data
    N:      .word         12 
    A:      .word         0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    B:      .word         0, -1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11
    #9, 8, 7, 6, 5, 4, 3, 2, 1, 0
.bss
    C:      .word         0 
.text
.global main
main:
    li t5, 0 #use to substract negative values
    li a1, 0 #added 4 every iterate
    li t1, 44 #negate 4 every iterate for B array
    li s1, 0 #added 4 every iterate
    
    la s3, C
    
    
    li a2, 48
    la a3, A
    add a4, a3, a1 #jump here to iterate
    lw a0, 0(a4)# loads the element value to a0
    
    
    la t3, B
    add t4, t3, t1
    lw t0, 0(t4)
    addi t1, t1, -4
    
    add s0, a0, t0
    bge s0, zero, 8
    
    sub s0, zero, s0 #try to use zero
    
    add s4, s3, a1
    sw s0, 0(s4) #save s0 value in c array at s4 position
    addi a1, a1, 4
    
    blt a1, a2, -52
    
    li a0, 0
    li a7, 93
    ecall
    
    
    