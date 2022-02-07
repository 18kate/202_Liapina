# TASK x >> y + 10
li a7, 5 
ecall
mv t0, a0 #storing x in t0
ecall
mv t1, a0 # storing y in t1

addi t1, t1, 10 
sra t0, t0, t1

li a7, 1
mv a0, t0
ecall


