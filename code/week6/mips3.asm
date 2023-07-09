# THUAT TOAN BUBBLE SORT CODE C

#    for (i = 0; i < n - 1; i++)
#      for (j = 0; j < n - i - 1; j++)
#          if (arr[j] > arr[j + 1])
#             swap(&arr[j], &arr[j + 1]);

.data 
A: .word 0,0,10,-2,4,5,1,2,3,-10,11	# Khai bao mang A
message: .asciiz "   " 

.text
	la $s0,A  			# dia chi cua A
	li $t0,10  			# n- 1 = 9
	li $t1,0			# i =0
for1:
	slt $t7,$t1,$t0 		# kiem tra i < n-1 ?
	beq $t7,$zero,end_for1 		# neu lon hon thoat vong for
	li $t2,0			# j =0 
	sub $t3,$t0,$t1			# n-i-1
for2:
	slt $t7,$t2,$t3 		# kiem tra j< n- i-1
	beq $t7,$zero,end_for2 		# neu lon hon thoa for2
	sll $t4,$t2,2 			# t2 * 4
	add $t5,$t4,$s0  		# t5 = t4 + s0 add+ add of A
	lw $t6,0($t5)			# lay a[j]
	lw $s6,4($t5)			# lay a[j+1]
	slt $s5,$s6,$t6			# so sanh a[i] va a[j+1]
	bne $s5,$zero,swap		# 
j next
swap:
	sw $t6,4($t5)
	sw $s6,0($t5)
next:
	addi $t2,$t2,1  		# j++
j for2
end_for2:
	addi $t1,$t1,1			# i ++
j for1
end_for1:

	la $s0,A			# in mang A ra man hinh
	li $s1,11
	li $s2,0
loop:
	slt $s3,$s2,$s1
	beq $s3,$zero,end_loop
	sll $s4,$s2,2
	add $s5,$s0,$s4
	lw $s6,0($s5)
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,message
	syscall
	addi $s2,$s2,1
	j loop
end_loop: