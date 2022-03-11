.include "macrolib.s"
.text
read_int(t2)
li t4, 2
for:
next:
beq t0, t2, end_for 
addi t0, t0, 1 
read_int(t1)
addi s1, s1, 4
addi sp, sp, -4
sw t1, (sp)
j next
end_for:
lw t1, (sp)
addi sp,sp,4
addi s1,s1,-4
rem t2,t1,t4
bltz s1, pass
beqz t2, output
j end_for
output:
print_int(t1)
li a0, '\n'
li a7, 11
ecall
blez s1, pass
j end_for
pass: