.text
li $v0,5
syscall
move $s1,$v0
li $s0,1	# i = 1
for:
slt $s5,$s0,$s1
beqz $s5,end_for
div $s2,$s0,3
mfhi $s3
beqz $s3,print
div $s2,$s0,5
mfhi $s3
beqz $s3,print
continue:
addi $s0,$s0,1
j for
end_for:
li $v0,10
syscall


print:
li $v0,1
move $a0,$s0
syscall
j continue
