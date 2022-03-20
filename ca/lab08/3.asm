.include "macrolib.s"
    
.eqv   BAZA    0x10010000

.text
    read_int(t2) 
    read_int(t3) 
    
    li s10, 32
    li s11, 96 
    
begin:
beqz t3, terminate

communist:
    mv t4, s10
    mv s5, s11
    slli s5, s5, 2
    li t0, BAZA
    add s5, s5, t0 
communistloop:
    beq t4, s11, communistend
    
    li t0, 128
    mul s6, t4, t0
    slli s6, s6, 2
    add s6, s6, s5 
    sw t2, 0(s6)
    
    addi t4, t4, 1
    j communistloop
communistend:

verh:
    mv t4, s10 
    mv s5, s6 
verh_z4loop:
    beq t4, s11, nothing
    
    addi t4, t4, 1
    sub s6, t4, s10
    slli s6, s6, 2
    sub s6, s5, s6 
    sw t2, 0(s6)

    j verh_z4loop
nothing:

levak:
    mv t4, s10 
    li t0, 128
    mul s5, t0, t0
    sub s5, s5, s11
    slli s5, s5, 2
    li t0, BAZA
    add s5, s5, t0 
levak_za4loop:
    beq t4, s11, pustota_levak
    
    li t0, 128
    mul s6, t4, t0
    slli s6, s6, 2
    sub s6, s5, s6
    sw t2, 0(s6)
    
    addi t4, t4, 1
    j levak_za4loop
pustota_levak:

up:
    mv t4, s10
    li t0, 128   
    mul s5, t4, t0
    slli s5, s5, 2
    li t0, BAZA
    add s5, s5, t0 
uploop:
    beq t4, s11, upend
    
    slli s6, t4, 2
    add s6, s6, s5
    sw t2, 0(s6)
    
    addi t4, t4, 1
    j uploop
upend:

addi t3, t3, -1
addi s10, s10, 1
addi s11, s11, -1
j begin

terminate:
