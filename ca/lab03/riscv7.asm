#TASK 7 2 * x * x - 3 * y + 4
li a7, 5 
ecall
mv t0, a0  #storing x in t0
ecall
mv t1, a0 # storing y in t1

mul t2, t0, t0
slli t0, t2, 1
addi t3, zero, 3
mul t3, t3, t1
sub t3, t0, t3
addi t3, t3, 4

li a7, 1
mv a0, t3
ecall
