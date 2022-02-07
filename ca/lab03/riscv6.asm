#TASK 6 x * 6 - y * 3
li a7, 5 
ecall
mv t0, a0  #storing x in t0
ecall
mv t1, a0 # storing y in t1

slli t2, t0, 1
add t3,t2,t2
add t0, t3, t2
add t2, t1, t1
add t3, t2, t1
NEG t1, t3
add t3, t1, t0

li a7, 1
mv a0, t3
ecall
