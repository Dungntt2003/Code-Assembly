.data
 i:  .word 5
 j:  .word 3
.text 
#Laboratory Exercise 3, Home Assignment 1
la $t8, i # Get the address of X in Data Segment
la $t9, j # Get the address of Y in Data Segment
lw $t1, 0($t8) # $t1 = X
lw $t2, 0($t9) # $t2 = Y
start:
slt $t0,$s2,$s1 # j<i
bne $t0,$zero,else # branch to else if j<i
addi $t1,$t1,1 # then part: x=x+1
addi $t3,$zero,1 # z=1
j endif # skip “else” part
else: addi $t2,$t2,-1 # begin else part: y=y-1
add $t3,$t3,$t3 # z=2*z
endif: