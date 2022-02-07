# TASK 5 (x << 2 - y + 5) >> 1
li a7, 5 
ecall
mv t0, a0 #storing x in t0
ecall
mv t1, a0 # storing y in t1

slli t0, t0, 2
NEG  t1, t1
add t0, t0, t1
addi t0, t0, 5
srai t0, t0, 1

li a7, 1
mv a0, t0
ecall
