main:
addi x1, x0, 2
addi x2, x0, 3
addi x3, x0, 5
addi x4, x0, 0
addi x5, x0, 1
addi x6, x0, 2
add x1, x1, x2
beq x1, x3, branch1
add x4, x4, x5
branch1:
add x4, x4, x6