#TASK 9 (x / y) * y + x % y
li a7, 5 
ecall
mv t0, a0  #storing x in t0
ecall
mv t1, a0 # storing y in t1

rem t2, t0, t1
div t3, t0, t1
mul t3, t3, t1
add t4, t3, t2

li a7, 1
mv a0, t4
ecall
