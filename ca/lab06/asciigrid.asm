.include "macrolib.s"
    
.macro printline(%m %x %y)    # macros for printline
mv   t1, %m      
mv   t0, zero      

loop:
beq  t1, t0, last_char    # in case equality holds, we leave the loop
print_char(%x)
print_char(%y)
addi t0, t0, 1      
j loop

last_char:
print_char(%x)
print_char('\n')
.end_macro
     

read_int(t0)      # read the value of M and put it into t0 
read_int(t1)      # read the value of M and put it into t1
mv   t2, zero      

loop_print:
beq  t2, t1, last_line      
printline t0, '+', '-'
printline t0, '|', ' '
addi t2, t2, 1      
j loop_print    # leave the loop and print the last line

last_line:
printline t0, '+', '-'
print_char('\n')