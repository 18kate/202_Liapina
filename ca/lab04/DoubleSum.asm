.text
li a7, 5 
ecall
mv t0, a0 #storing t0
ecall
mv t1, a0 #storing t1
ecall
mv t2, a0 #storingt2
ecall
mv t3, a0 #storing t3

add t4, t2, t0 #add 1 and 3
add t5, t1, t3 #add 2 and 4

mv a0, t4
li a7, 1
ecall #print the first sum
li a0, '\n'
li a7, 11
ecall #print the new line
li a7, 1
mv a0, t5
ecall #print the second sum