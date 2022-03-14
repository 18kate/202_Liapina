.include "macrolib.s"

main:
#input of lengths
read_int (t0) 	
read_int (t1)
read_int (t2)		

mv a0, t0
mv a1, t1
mv a2, t2

jal check_triangle #call the check function
beqz a0, terminate 
li t0, 1
beq a0, t0, print_Y # if check_triangle returns 1 we print Y
print_char('N')
print_char('\n')
j main

print_Y:
print_char ('Y')
print_char('\n')
j main
 
terminate:
li a7, 10
ecall
    

check_triangle:
or t0, a0, a1
or t0, t0, a2
  
beqz t0, return	# if all three numbers are 0 - return 0  
add t1, a0, a1	# t1 = a + b
add t2, a0, a2	# t2 = a + c	
add t3, a1, a2	# t3 = b + c	
 
#if any of these would hold - return 2    
bgt a0, t3, doesnt_exist 
bgt a1, t2, doesnt_exist
bgt a2, t1, doesnt_exist 
    
li a0, 1

j return 

doesnt_exist:
li a0, 2 # return 2
    
return:
jr ra		
    	
    
    
    
