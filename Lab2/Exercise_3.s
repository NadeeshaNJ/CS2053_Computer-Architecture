.data
    N:      .word         12  
.bss
    V:      .word         0, 1 
.text
.global main
main:
    li a1, 8 #added 4 every iterate
    li a2, 48
    la a3, V
    add a4, a3, a1 #jump here to iterate
    lw s0, -4(a4) # loads the V(i-1) value to a0
    lw s1, -8(a4) # loads the V(i-2) value to a0
    
    add s2, s1, s0
    sw s2, 0(a4)
    
    addi a1, a1, 4
    blt a1, a2, -32
    
    li a0, 0
    li a7, 93
    ecall
    
    
    