.include "macrolib.s"
read_double(fs0)  
read_double(fs1)

addi t0, zero, 2
fcvt.d.w fa0, t0
addi t0, zero, 0
fcvt.d.w fa7, t0 #lower border
fmv.d fa6, fs0 #upper border


while:
fadd.d fa4, fa6, fa7 
fdiv.d fa4, fa4, fa0


fmul.d fa1, fa4, fa4
fmul.d fa1, fa1, fa4 # K^3
fabs.d fa1, fa1 # |k^3|
fabs.d fa2, fs0 # |A|
fsub.d fa3, fa2, fa1
fabs.d fa3, fa3 #fa3 = |A - K^3|
fle.d s1, fa3, fs1
#if epsilon > |A - K^3| - finish the program 
bgtz s1, terminate
#else - choose new border
fge.d s1, fa1, fa2
bgtz s1, first_case
fle.d s1, fa1, fa2
bgtz  s1, second_case

second_case:
fmv.d fa7, fa4
j while

first_case:
fmv.d fa6, fa4
j while

terminate:
print_double(fa4)

