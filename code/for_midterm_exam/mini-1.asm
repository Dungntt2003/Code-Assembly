.data
A: 		.word 1,3,1,2,1
Aend: 		.word
Message1: 	.asciiz "Chuoi sai"
Message2:	.asciiz "Chuoi dung"
.text
# Ý tưởng : Tạo 1 vòng lặp chạy từ 2 đến n
#so sánh a[i] với số thoả mãn dãy tăng ở đằng trước sau đó cập nhật lại 
main:
	la $a0,A		
	la $a1,Aend
	addi $t0,$a0,0
	addi $a1,$a1,-4			#địa chí gtri cuối cùng trong dãy
	lw $s0,0($a0)
	jal daytang
done:
 	li $v0,55
 	la $a0,Message2
 	syscall
 	j end	
daytang:
	#$t0:biến chạy i
	#$s1:lưu giá trị i
	#$s0:giá trị ở đằng trước i thoả mãn dể là dãy tăng 
	#s2:đếm số lần số ko thoả mãn là dãy tăng
	#s3:lưu giá trị i-2
 loop:
 	beq $t0,$a1,done		#nếu i khác n,thì chạy
 	addi $t0,$t0,4			#i=i+1
 	lw $s1,0($t0)			#lưu giá trị ở địa chỉ i vào $s1
 	slt $t1,$s0,$s1			#so sánh $s0 với $s1
 	beq $t1,$0,ktra			# nếu $s0 > $s1, nhảy đến ktra,ko thì update lại $s0
 	j update
 
 ktra:
 	bne $s2,$0,in			#nếu $s2=1 thì in ra ko thoả mãn
 	addi $s2,$s2,1			#s2=s2+1
 	addi $t3,$t0,-8			#i=i-2
 	lw $s3,0($t3)			#lưu giá trị địa chỉ i vào $s3
 	slt $t2,$s1,$s3			#ss giá trị $s1 và $s3, nếu s3>s1 thì update lại $s0 
 	bne $t2,$0,next
 update:
 	move $s0,$s1
 next:
 	j loop
 	
daytang_end:
	 jr $ra

in:
 	li $v0,55
 	la $a0,Message1
 	syscall
 	j end
end:
	li $v0,10
 	syscall
 	
