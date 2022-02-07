#TASK 10 x & (-1 << 5)
li a7, 5 
ecall
mv t0, a0  #storing x in t0
#ecall
#mv t1, a0 # storing y in t1

li t1, -1
slli t2, t1, 5
and t3, t0, t2

li a7, 1
mv a0, t3
ecall
