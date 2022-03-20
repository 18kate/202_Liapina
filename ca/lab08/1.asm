.data
digits: .word 0x3f, 0x6, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x7, 0x7f, 0x6f 
.macro exit
    li      a7, 10
    ecall
.end_macro

.macro print_hex(%x)
    mv      a0, %x
    li      a7, 34
    ecall
.end_macro


.macro newline
    li      a0, '\n'
    li      a7, 11
    ecall
.end_macro


.macro output_numbers(%thomas, %shelby) 
mv s6, zero
z4loop1:
addi s6, s6, 1
srli %thomas, %thomas, 1
bnez %thomas, z4loop1
    
mv %thomas, s6
mv s6, zero
z4loop2:
addi s6, s6, 1
srli %shelby, %shelby, 1
bnez %shelby, z4loop2
    
mv %shelby, s6
addi %thomas, %thomas, -1
addi t6, zero, 4
mul %thomas, %thomas, t6
add %thomas, %thomas, %shelby
addi %thomas, %thomas, -1

li t3, 10
rem %shelby, %thomas, t3 
div %thomas, %thomas, t3 
    
lui t3, 0xffff0

la t4, digits
li t5, -1
z4loop3:
addi t5, t5, 1
addi t4, t4, 4
bne t5,%shelby, z4loop3
    
lw t1, -4(t4) 
sb t1, 0x10(t3)
la t4, digits
    
li t5, -1
z4loop4:
addi t5, t5, 1
addi t4, t4, 4
bne t5,%thomas, z4loop4
    	
lw t2, -4(t4)
sb t2, 0x11(t3)
.end_macro

    .text
main:
    lui     s0, 0xffff0  
    mv      s1, zero      
    mv      s2, zero     
    li      s3, 20     
loop:
    li      t0, 1        
    sb      t0, 0x12(s0) 
    lb      t1, 0x14(s0) 
    bnez    t1, pressed
    
    li      t0, 2
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 4
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 8
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    mv      s2, zero 
    j       loop
pressed:
    beq     t1, s2, loop
    mv      s2, t1
    slli s3, t1, 24	 
    srli s3, s3, 24
    slli s4, s3, 28 
    srli s4, s4, 28 
    srli s5, s3, 4 
    
    output_numbers(s4, s5)
    print_hex(t1)
    newline

    addi    s1, s1, 1
    ble     s1, s3, loop
end:
    exit
    