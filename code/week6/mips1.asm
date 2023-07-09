.data
A: .word 2,3,4,6,-1,-2,3,4	# khoi tao mang
message: .asciiz " "		
message1: .asciiz "\nTong la "
.text
main: 
	la $a0,A
 	li $a1,8
 	j mspfx
 	nop

mspfx: 
    	addi $v0,$zero,0 
    	addi $v1,$zero,0 
    	addi $t0,$zero,0 
    	addi $t1,$zero,0 
loop: 
    	add $t2,$t0,$t0 
    	add $t2,$t2,$t2 
    	add $t3,$t2,$a0 
    	lw  $t4,0($t3) 
    	add $t1,$t1,$t4 
   	slt $t5,$v1,$t1 
    	bne $t5,$zero,mdfy 
    	j test 
mdfy: 
    	addi $v0,$t0,1 
    	addi $v1,$t1,0 
test: 
    	addi $t0,$t0,1 
    	slt $t5,$t0,$a1 
    	bne $t5,$zero,loop 
done:   j continue
mspfx_end:
continue:
end_of_main:

    	move $s1,$v0
    	la $s0,A
    	li $t0,0
loops :
    	add $t2,$t0,$t0
    	add $t2,$t2,$t2
    	add $t3,$t2,$s0
    	lw $t4,0($t3)
    	li $v0,1
    	move $a0,$t4
    	syscall
    	li $v0,4
    	la $a0,message
    	syscall
    	addi $t0,$t0,1
    	slt $t5,$t0,$s1
    	bne $t5,$zero,loops
    	li $v0,4
    	la $a0,message1
    	syscall
    	li $v0,1
    	move $a0,$v1
    	syscall


    
