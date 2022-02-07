#TASK 14 x > y ? 0 : 1
li a7, 5 
ecall
mv t0, a0  
ecall
mv t1, a0 

slt t2, t1, t0
xori t3, t2, 1

li a7, 1
mv a0, t3
ecall
