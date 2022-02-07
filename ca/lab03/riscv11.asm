#TASK 11 x | (-1 >> 27)
li a7, 5 
ecall
mv t0, a0  #storing x in t0
#ecall
#mv t1, a0 # storing y in t1

li t1, -1
srli t1, t1, 27
or t2, t0, t1

li a7, 1
mv a0, t2
ecall
