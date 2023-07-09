.data 
A: .word 2,3,4,-1,2,10,-13,6
Message: .asciiz "\n\nTich lon nhat la "
.text 
	li $s0,0	# i =0
	li $t0,-999999	# max = -99999
	li $t8,7 	# n-1 =8 -1
	la $s1,A	# load address of A
	jal find_max	# jump to produce : find_max
	
# Print se in ra man hinh tich lon nhat co duoc
# thoat chuong trinh bang v0 = 10, exit
print:
	li $v0,4	# set v0 = 4 to print string
	la $a0,Message
	syscall		# call
	li $v0,1	# set v0 = 1 to print number
	move $a0,$t0
	syscall		# call
	li $v0,10	# set v0 = 10 to exit
	syscall
# chuong trinh con find_max tim tich lon nhat
# s0 : bien i , t8 : n - 1 , s1 : dia chi cua mang A
# t0: max khoi tao ban dau -99999
# chuong trinh duyet qua tung phan tu de tinh tich
# neu lon hon max da co thi cap nhap max moi
# neu khong thi giu nguyen max cu

find_max:
for:
	slt $s2,$s0,$t8		# set s2 : s0 < t8 ?
	beqz $s2,end_for	# if s0 >= t8 jum end_for	
	add $s3,$s0,$s0		# s3 = 2*s0
	add $s3,$s3,$s3		# s3 = 2* s3
	add $s4,$s3,$s1		# s4 = s3 + s1 to get address of elements 
	lw $s5,0($s4)		# load word to get value A[i]
	lw $s6,4($s4)		# get value of A[i+1]
	mul $s7,$s5,$s6		# A[i] * A[i+1]
	slt $t2,$s7,$t0		# compare with max : $t1 < $t0 ?
	beqz $t2,swap		# if t1 > t0 : jump to swap
continue:
	addi $s0,$s0,1		# i = i + 1
	j for			# return to the for loop

swap:
	move $t0,$s7		# s0 = t7 : get new max
	j continue		# continue the for loop

end_for:
end_find:
	jr $ra			# return the main produce


