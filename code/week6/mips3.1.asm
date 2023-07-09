.data 
A: .word 3,6,8,4,9,-5,3,7,10,2
message: .asciiz "   "
.text 
li $s0,9
la $a0,A
li $t0,0 #i
li $t1,0
sort :
for1:
slt $t2,$t0,$t0 #i<n-1
beq $t2,$zero,end_sort
li $t1,0
sub $s1,$s0,$t0
for2:
slt $t3,$t1,$s1 #j<n-i-1
beq $t3,$zero,end_for2
sll $t4,$t1,2
add $t5,$a0,$t4
lw $t6,0($t5)
lw $t7,4($t5)
slt $t8,$t7,$t6
bne $t8,$zero,swap
j nextj
swap:
sw $t6,4($t5)
sw $t7,0($t5)
nextj:
addi $t1,$t1,1
j for2
end_for2:
addi $t0,$t0,1

j for1
endfor1:
end_sort:
la $s0,A 
      li $t0,0
      li $s1,10
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

