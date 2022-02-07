#TASK 8 (x + 5) / y + 10 / (y - 1)
li a7, 5 
ecall
mv t0, a0  #storing x in t0
ecall
mv t1, a0 # storing y in t1

addi t0, t0, 5
div t2, t0, t1
addi t3, zero, 10
addi t1, t1, -1
div t3, t3, t1
add t4, t2, t3

li a7, 1
mv a0, t4
ecall
