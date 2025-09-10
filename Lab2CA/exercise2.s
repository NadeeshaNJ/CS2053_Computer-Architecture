.data
N:      .word 12
A:      .word 0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3
B:      .word 9, -3, 8, 1, -6, 4, 3, -7, 2, 10, -5, 1
C:      .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0      # Result array

.text
.globl main
main:
    li a0, 0      
    li a1, 12             

    la a2, A              
    la a3, B              
    la a4, C          

loop:
    beq a0, a1, end       

    slli a5, a0, 2    
    add a6, a2, a5        
    lw a7, 0(a6)          

    
    li s0, 11             
    sub s0, s0, a0        
    slli s1, s0, 2    
    add s0, a3, s1    
    lw s1, 0(s0)       

   
    add s0, a7, s1     

 
    bgez s0, skip_abs 
    sub s0, x0, s0    

skip_abs:
    add a6, a4, a5     
    sw s0, 0(a6)       

    addi a0, a0, 1    
    j loop

end:
    li a0, 0
    li a7, 93
    ecall
