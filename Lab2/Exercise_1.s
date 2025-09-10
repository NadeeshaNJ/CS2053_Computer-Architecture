.data
    N:      .word         12 
    A:      .word         0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3
   
.bss
    B: .word 0
.text
.global main
main:
    li a1, 0 #added 4 every iterate
    li t1, 0 #added 4 every iterate for B array
    li a2, 48
    la a3, A
    add a4, a3, a1 #jump here to iterate
    lw a0, 0(a4)
    # loads the element value to a0
    andi a5, a0, 1 # element value a0
    bne a5, zero, 36 #jump 9 instrcutions forward 
                     #if odd (compare AND gated a5 with 0)  
    blt a0, zero, 32 #if number is less than 0 jump
    beq a0, zero, 28
    #if even
    li t2, 48
    la t3, B
    add t4, t3, t1
    sw a0, 0(t4)
    addi t1, t1, 4
    
    #if array is not over
    addi a1, a1, 4 # jump here if odd
    blt a1, a2, -52
    
    li a0, 0
    li a7, 93
    ecall
    
    
    
    