#TASK 12 set the y-th bit of x to 1
li a7, 5 
ecall
mv t0, a0  #storing x in t0
ecall
mv t1, a0 # storing y in t1

li t2, 1
addi t3, t1, -1
sll t4, t2, t3 
or t5, t3, t0

li a7, 1
mv a0, t5
ecall
