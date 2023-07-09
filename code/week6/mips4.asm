# THUAT TOAN INSERTION SORT CODE C

#void insertionSort(int arr[], int n)
#{
#    int i, key, j;
#    for (i = 1; i < n; i++)
#    {
#        key = arr[i];
#        j = i - 1;
#        while (j >= 0 && arr[j] > key)
#        {
#            arr[j + 1] = arr[j];
#            j = j - 1;
#        }
#        arr[j + 1] = key;
#    }
#}


.data 
A: .word -1,10,2,3,5,1,2,3,5,5	# khai bao mang
message: .asciiz "     "	# khai bao message
.text 
	la $s0,A			
	li $s1,10			# n = 10
	li $s2,1			# i = 1
for:
	slt $s3,$s2,$s1			# so sanh i<n
	beq $s3,$zero,end_for		# neu lon hon end for
	sll $s4,$s2,2			#  i*4
	add $s5,$s4,$s0			# s5 = 4i + add of a
	lw $s6,0($s5)			# key = arr[i]
	subi $s7,$s2,1			# j = i-1
loop: 
	sle $t0,$zero,$s7		# kiem tra 0 <= j
	beq  $t0,$zero,end_loop		# neu sai thi end loop
	sll $t1,$s7,2			#  j*4
	add $t2,$t1,$s0			# t2 = t1 + s0 load add
	lw $t3,0($t2)			# lay arr[j]
	slt $t4,$s6,$t3			# so sanh key voi arr[j]
	beq $t4,$zero,end_loop		# neu key > arr[j] end loop
	sw $t3,4($t2)			# arr[j+1] = a[j]
	subi $s7,$s7,1			# j = j-1
j loop
end_loop:			# endloop
	sw $s6,4($t2)
	addi $s2,$s2,1			# i++
j for
end_for:

	la $s0,A			# In cac phan tu sau khi sap xep ra man hinh
	li $s1,10
	li $s2,0
loops:
	slt $s3,$s2,$s1
	beq $s3,$zero,end_loops
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
	j loops
	end_loops:


