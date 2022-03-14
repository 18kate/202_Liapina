.include "macrolib.s"    
.data
array: .word

.text
main:
la t4, array # loading adress of first element of an array into t4
read_int (t1) # t1 - number of elements 	
mv t0, t4 # t0 = array[0]

loop_input:
read_int (t2) #input int array[i]		
sw t2, 0(t0)		
addi t0, t0, 4		
addi t1, t1, -1		

bnez t1, loop_input #if t1 != 0 continue to input variables
addi t0, t0, -4
mv a0, t4 #t4 - address of array[0]
mv a1, t0 #t0 - address of array[n-1]

jal bubble_sort	

mv t0, a0 #t0 - address of array[0]
mv t1, a1 #t1 - address of array[n-1]

loop_print:
lw t2, 0(t0) #load array[i] to t2
print_int (t2)
print_char(' ')

addi t0, t0, 4 #iterate through the array
ble t0, t1, loop_print #if t0 reaches t1 - exit the loop and terminate the prorgram


li a7, 10
ecall 


bubble_sort:
mv t0, a0 #t0 = addreess of array[0]
mv t1, a1 #t1 = addreess of array[n-1]

outer_loop: #for i in range(len(arr)) 
bgt t0, t1, return #if t0 > t1 we leave the outer lopp and return array
lw t3, 0(t0) #load in t3 array[i]
mv t2, a0 

inner_loop: 
beq t2, t0, finish_loop # if t2 == t0 then finish loop
lw t4, 0(t2)
  
bgt t3, t4, next_iter

#swap values in case needed
sw t3, 0(t2)			
sw t4, 0(t0)				
lw t3, 0(t0)        		
lw t4, 0(t2)			

next_iter: # j increment
addi	t2, t2, 4
j inner_loop 	
  	
finish_loop: #i increment
addi t0, t0, 4
j outer_loop  

return:
jr ra			
    	

   