.data
A: .word -5,4,3,8,10,23,-10,2,3,5,-10
Aend: .word 
message: .asciiz "  "
.text
main: 
     	la $a0,A 
     	la $a1,Aend
     	addi $a1,$a1,-4 
     	j sort 
 end_main:

 sort: 
     	beq $a0,$a1,done 
 	j max 
after_max: 			
	lw $t0,0($a1) 			
     	sw $t0,0($v0) 
     	sw $v1,0($a1) 
     	addi $a1,$a1,-4 
     	j sort 
done: 	j after_sort

max:
     	addi $v0,$a0,0		
     	lw $v1,0($v0) 
     	addi $t0,$a0,0 
loop:
     	beq $t0,$a1,ret 
     	addi $t0,$t0,4 
     	lw $t1,0($t0) 
     	slt $t2,$t1,$v1 
     	bne $t2,$zero,loop 
     	addi $v0,$t0,0 
     	addi $v1,$t1,0 
j loop 
ret:
j after_max
after_sort:
      	la $s0,A 
      	li $t0,0
	li $s1,11
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

