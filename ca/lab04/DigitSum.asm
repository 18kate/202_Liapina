  
.include "macrolib.s"
.text
li a7, 5
ecall
mv t0, a0  #storing our number in t0

li t4, 10
li t1, -1

bltz t0, inverse
j while
inverse:
mul t0, t0, t1

while:
beqz t0, finalres
rem t2, t0, t4
add t3, t3, t2
div t0, t0, t4
j while
finalres:
print_int(t3)