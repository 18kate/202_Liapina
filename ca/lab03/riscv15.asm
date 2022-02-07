#TASK 15 (x == (y + 3)) ? 0 : 1
li a7, 5 
ecall
mv t0, a0  
ecall
mv t1, a0 

addi t1, t1, 3		
neg t1, t1		
add t3, t0, t1		
seqz t4, t3		
xori t5, t4, 1

li a7, 1
mv a0, t3
ecall
