.data
N:          .word 12
A:          .word 0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3
B:          .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0       # 12 slots max
newline:    .string "\n"

.text
.globl main
main:
    la a0, A       
    la a1, B           
    li a2, 0        
    li a3, 0           
    li a4, 12       

loop:
    beq a2, a4, done  

    slli a5, a2, 2  
    add a6, a0, a5  
    lw a7, 0(a6)    

    blez a7, skip   
    andi s0, a7, 1  
    bne s0, x0, skip   

    # Store in B[j]
    slli s1, a3, 2  
    add s1, a1, s1     
    sw a7, 0(s1)       
    addi a3, a3, 1

skip:
    addi a2, a2, 1  
    j loop

done:
   
    la a0, newline
    li a7, 4
    ecall

    li a0, 0
    li a7, 93
    ecall
