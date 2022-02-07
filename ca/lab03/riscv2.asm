#  TASK 2 x >> 2 + (y - 1) << 3
li a7, 5 
ecall
mv t0, a0  #storing y in t0
ecall
mv t1, a0 # storing x in t1

addi t1, t1, -1
addi t1, t1, 2
srl t1, t0, t1
slli t1, t1, 3

li a7, 1
mv a0, t1
ecall

# 8 1 16
# 8 2 8