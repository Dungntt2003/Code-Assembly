.eqv KEY_CODE 0xFFFF0004 
.eqv KEY_READY 0xFFFF0000 
.eqv DISPLAY_CODE 0xFFFF000C 
.eqv DISPLAY_READY 0xFFFF0008 
.data
.text
     li $k0, KEY_CODE
     li $k1, KEY_READY
     li $s0, DISPLAY_CODE
     li $s1, DISPLAY_READY
main:
lan1:
     jal loop 
     beq $t0,101,lan2
     j lan1
lan2:
     jal loop
     beq $t0,120,lan3
     beq $t0,101,lan2
     j lan1
lan3:
     jal loop
     beq $t0,105,lan4
     beq $t0,101,lan2
     j lan1
lan4:
     jal loop
     beq $t0,116,end
     beq $t0,101,lan2
     j lan1
end:
     li $v0,10
     syscall

loop:
    nop
WaitForKey: 
    lw $t1, 0($k1) 
    nop
    beq $t1, $zero, WaitForKey
    nop

ReadKey: 
   lw $t0, 0($k0) 
   nop
WaitForDis: 
   lw $t2, 0($s1) 
   nop
   beq $t2, $zero, WaitForDis 
   nop 
ShowKey: 
   sw $t0, 0($s0) 
   nop
   jr $ra