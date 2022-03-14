.include "macrolib.s"
main:
read_double(fa1) #number A
read_double(fa2) #Number B
read_int(a2) #precision

#just load 10 in two double registers - we gonna need that later on
li a1, 10
fcvt.d.w fa3, a1
fcvt.d.w fa4, a1 

power_of_ten:
fmul.d fa3, fa3, fa4
addi a2, a2, -1
bgt a2, zero, power_of_ten #fa3 = 10 ^ n

fdiv.d fa5, fa1, fa2 #fa5 = A/B
fmul.d fa7, fa3, fa5 #fa7 = A/B * 10 ^ n
fcvt.w.d a3, fa7 # a3 = int(fa7)
div a3, a3, a1
fdiv.d fa3, fa3, fa4 
fcvt.d.w fa1, a3
fdiv.d fa1, fa1, fa3

print_double(fa1)