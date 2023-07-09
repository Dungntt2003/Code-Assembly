.data
prompt: .asciiz "Nhập số nguyên dương: "
result: .asciiz "Kết quả (hệ nhị phân): "

.text
.globl main

main:
    li $s0, 32
    # In ra lời nhắc để nhập số nguyên dương
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Đọc số nguyên dương từ bàn phím
    li $v0, 5
    syscall
    
    # Lưu giá trị số nguyên dương vào thanh ghi $t0
    move $t0, $v0
    
    # In ra lời nhắc kết quả
    li $v0, 4
    la $a0, result
    syscall
    
    # Gọi hàm chuyển đổi hệ 10 sang hệ nhị phân
    jal convertToBinary
    
    # Kết thúc chương trình
    li $v0, 10
    syscall

convertToBinary:
    # Xử lý từng bit của số nguyên dương và in ra màn hình
    li $t1, 1  # Sử dụng thanh ghi $t1 làm biến đếm
    li $t2, 0  # Sử dụng thanh ghi $t2 để lưu giá trị bit
    
    loop:
        # Lấy giá trị bit tại vị trí $t1
        and $t2, $t0, $t1
        
        # In ra giá trị bit
        beqz $t2, zero
        li $v0, 1
        move $a0, $t2
        syscall
        
        zero:
        # Chuyển sang bit tiếp theo
        sll $t1, $t1, 1
        
        # Kiểm tra điều kiện lặp
        slt $t3, $t1, $s0
        bnez $t3, loop
        
    # Kết thúc hàm chuyển đổi
    jr $ra
