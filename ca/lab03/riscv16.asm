#FINAL TASK 16  x < -5 & y > 10
li a7, 5 
ecall
mv t0, a0  
ecall
mv t1, a0 

slti t2, t0, -5
li  t3, 10
slt t4, t3, t1
and t5, t2, t4

li a7, 1
mv a0, t5
ecall
