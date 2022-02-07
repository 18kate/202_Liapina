#TASK 13 reset the y-th bit of x to 0
li a7, 5 
ecall
mv t0, a0  
ecall
mv t1, a0 

li t2, 1
addi t3, t1, -1
sll t4, t2, t3
not t5, t4
and t2, t5, t0

li a7, 1
mv a0, t2
ecall
