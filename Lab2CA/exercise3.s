.data
N:      .word 12
V:      .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0    # Allocate space for 12 Fibonacci numbers

.text
.globl main
main:
    la a0, V       
    li a1, 0       
    sw a1, 0(a0)   
    li a1, 1        
    sw a1, 4(a0)    

    li a2, 2   
    li a3, 12 

loop:
    beq a2, a3, end  

   
    addi a4, a2, -1
    slli a5, a4, 2
    add a6, a0, a5
    lw s0, 0(a6)  

  
    addi a4, a2, -2
    slli a5, a4, 2
    add a6, a0, a5
    lw s1, 0(a6)  

   
    add s0, s0, s1

 
    slli a4, a2, 2
    add a5, a0, a4
    sw s0, 0(a5)

    addi a2, a2, 1 
    j loop

end:
    li a0, 0
    li a7, 93
    ecall
