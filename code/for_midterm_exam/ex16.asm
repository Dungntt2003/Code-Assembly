.data 
A: .word 1,3,2,1,2,1,10,12
Message: .asciiz "\n\n Co the tao duoc day tang nghiem ngat"
Non_message: .asciiz "\n\n Khong the tao duoc day tang nghiem ngat"

.text
li $s0,1	# i = 1
li $t0,8	# n = 4
li $t8,7	# n - 1 = 3
la $v0,A
li $v1,0 	# define removed =false
jal Remove
print:
seq $s6,$v1,1
bnez $s6,print_true
seq $s6,$v1,0
bnez $s6,print_false

print_true:
li $v0,4
la $a0,Message
syscall
j exit
 
print_false:
li $v0,4
la $a0,Non_message
syscall
j exit

exit:
li $v0,10
syscall

Remove:
seq $t1,$t0,2
bnez $t1,return_true
for:
slt $t2,$s0,$t0
beqz $t2,return_true
add $s1,$s0,$s0
add $s1,$s1,$s1
add $s2,$v0,$s1
if_1:
lw $s3,0($s2)
lw $s4,-4($s2)
sle $s5,$s3,$s4
beqz $s5,continue
seq $s6,$v1,1
bnez $s6,return_false
seq $s6,$s0,1
bnez $s6,set_true
lw $s7,-8($s2)
slt $s6,$s7,$s3
bnez $s6,set_true
seq $s6,$s0,$t8
bnez $s6,set_true
lw $t7,4($s2)
slt $s6,$s4,$t7
bnez $s6,set_true
j return_false
end_if_1:
continue:
addi $s0,$s0,1
j Remove
return_true:
li $v1,1
j end_Remove
return_false:
li $v1,0
j end_Remove
set_true:
li $v1,1
j continue
end_Remove:
jr $ra
