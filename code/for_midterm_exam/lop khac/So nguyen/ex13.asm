.text
li $v0,5
syscall
move $s0,$v0	# N
li $v0,5
syscall	
move $s1,$v0	# M
move $s2,$s0	# i = n

for: 
sle $s3,$s2,$s1
beqz $s3,end_for
j check_prime
addi $s2,$s2,1
j for
end_for:
check_prime:
li $s4,2
for_2:
slt $s5,$s4,$s2
beqz $s5,end_for2
addi $s4,$s4,1

j for_2
end_for2:
