
.data 
 i : .word 10
 n: .word 20
 step : .word 2
 a: .word 10

.text
la $t8, i
la $t9, n
la $t7, step
la $t6, a
lw $s1, 0($t8)
lw $s3, 0($t9)
lw $s4, 0($t7)
lw $s2, 0($t6)
loop: add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
add $s5,$s5,$t0 #sum=sum+A[i]
bne $s1,$s3,loop #if i != n, goto loop