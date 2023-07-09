.eqv HEADING 0xffff8010 
.eqv MOVING 0xffff8050 
.eqv LEAVETRACK 0xffff8020 
.eqv WHEREX 0xffff8030 
.eqv WHEREY 0xffff8040 
.text 
main: 
   jal TRACK 
   nop
   addi $a0, $zero, 90
   jal ROTATE
   nop
   jal GO
   nop
sleep1: 
   addi $v0,$zero,32 
   li $a0,3000 
   syscall
   jal UNTRACK 
   nop
   jal TRACK 
   nop
goDOWN: 
   addi $a0, $zero, 180 
   jal ROTATE
   nop
sleep2: 
   addi $v0,$zero,32 
   li $a0,3000 
   syscall
   jal UNTRACK 
   nop
   jal TRACK 
   nop
goLEFT: 
   addi $a0, $zero, 315 
   jal ROTATE
   nop
 
sleep3: 
   addi $v0,$zero,32 
   li $a0,4000 
   syscall
   jal UNTRACK
   nop

 

end_main:
GO: li $at, MOVING 
 addi $k0, $zero,1
 sb $k0, 0($at) 
 nop 
 jr $ra
 nop

STOP: li $at, MOVING
 sb $zero, 0($at) 
 nop
 jr $ra
 nop

TRACK: li $at, LEAVETRACK 
 addi $k0, $zero,1 
 sb $k0, 0($at) 
 nop
 jr $ra
 nop 
UNTRACK:li $at, LEAVETRACK 
 sb $zero, 0($at) 
 nop
 jr $ra
 nop
ROTATE: li $at, HEADING 
 sw $a0, 0($at) 
 nop
 jr $ra
 nop
