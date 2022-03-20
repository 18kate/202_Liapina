.include "macrolib.s"

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

.macro malinovaya_lada(%thomas, %shelby)
mv a2, zero
lp:
addi a2, a2, 1
srli %thomas, %thomas, 1
bnez %thomas, lp

mv %thomas, a2
li a2, 0
lp2:
addi a2, a2, 1
srli %shelby, %shelby, 1
bnez %shelby, lp2

mv %shelby, a2
addi %thomas, %thomas, -1
addi t0, zero, 4
mul %thomas, %thomas, t0
add %thomas, %thomas, %shelby
addi %thomas, %thomas, -1

beq t1, %thomas, found
beqz %thomas, NENAHOD
bne t1, %thomas, begin
    
.end_macro    
    
    

.text
main:
    li a7, 5
    ecall
    add s9, zero, a0
    begin:
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

    malinovaya_lada(s4, s5)    

    

found:
print_str("FOUND")
exit

NENAHOD:
print_str("STOPPED")
exit
