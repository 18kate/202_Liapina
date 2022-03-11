.include "macrolib.s"
.text
li t1, 1
li t5, -1
read_int(t0)
while:
beqz t0, finalres
read_int(t2)
mul t2, t2, t1
add t3, t3, t2
mul t1, t1, t5
addi t0, t0, -1
j while
finalres:
print_int(t3)