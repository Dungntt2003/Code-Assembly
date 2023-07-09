.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014
.text
main: 
	li $t1, IN_ADRESS_HEXA_KEYBOARD
 	li $t2, OUT_ADRESS_HEXA_KEYBOARD
 	li $t4, 0x10
set:	li $t3, 0x01		# scan from first row
polling: 
	sb $t3, 0($t1 ) 		# must reassign expected row
 	lb $a0, 0($t2) 		# read scan code of key button
 	bne $a0, $0,print
 	j sleep
 print: 
 	li $v0, 34 		# print integer (hexa)
	syscall
 sleep: 
 	li $a0, 10 		# sleep 1000ms
 	li $v0, 32
 	syscall 
 	sll $t3,$t3,1
 	beq $t3,$t4,reset
 	j polling
  reset: 	li $t3,0x01
 	j polling

