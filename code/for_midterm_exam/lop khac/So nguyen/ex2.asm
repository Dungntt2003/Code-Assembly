.text
li $v0,5
syscall
move $s0,$v0
li $s1, 1
li $s2,1
li $v0,1
move $a0,$s1
syscall
li $v0,1
move $a0,$s2
syscall
for:
slt $s4,$s2,$s0
beqz $s4,end_for
add $s3,$s1,$s2
j print
continue:
move $s1,$s2
move $s2,$s3 
j for
end_for:
li $v0,10
syscall


print:
li $v0,1
move $a0,$s3
syscall
j continue