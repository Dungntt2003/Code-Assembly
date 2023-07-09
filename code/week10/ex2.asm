.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
    li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
    li $a0, GREEN
    li $s0,0
    li $s1,256
 scan_one_row:
    add $t0,$k0,$s0
    sw $a0,0($t0)
    addi $s0,$s0,4
    bne $s0,$s1,scan_one_row