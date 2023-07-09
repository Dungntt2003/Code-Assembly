.text
li $s6, 0x10010000
lui $s0,0x2AB9
ori $s0, $s0, 0x6F84
sw $s0, 0($s6)
lb $s1, 2($s6)