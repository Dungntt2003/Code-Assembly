.data
input:  .space 100   # Buffer to store user input
palindromes: .space 10000  # Array to store palindromes
numPalindromes: .word 0     # Variable to keep track of the number of palindromes
notPalindromeMsg: .asciiz "The input is not a palindrome.\n"
palindromeStoredMsg: .asciiz "Palindrome stored: "
.text
.globl main
main:
    li $v0, 8     # Read string syscall
    la $a0, input # Load the buffer address
    li $a1, 100   # Maximum input length
    syscall

    # Check if the input is a palindrome
    la $a0, input   # Load the input address
    jal isPalindrome

    beqz $v0, notPalindrome  # Branch if not a palindrome

    # Check if the palindrome is already stored
    la $a0, input   # Load the input address
    jal isDuplicate

    beqz $v0, storePalindrome  # Branch if not a duplicate

    j exit   # Jump to exit if duplicate

notPalindrome:
    li $v0, 4     # Print string syscall
    la $a0, notPalindromeMsg
    syscall

    j exit   # Jump to exit

storePalindrome:
    la $a0, input  # Load the input address
    jal storePalindromeInMemory

    j exit   # Jump to exit

isPalindrome:
    move $t0, $a0    # Save the input address
    move $t1, $a0    # Save the input address

    li $t2, 0       # Initialize index to 0

    loop:
        lbu $t3, 0($t1)     # Load a byte from the input
        beqz $t3, endLoop   # Branch if end of string is reached

        addi $t1, $t1, 1    # Increment the input address
        addi $t2, $t2, 1    # Increment the index

        j loop   # Jump to loop

    endLoop:
        subi $t1, $t1, 1    # Decrement the input address to the last character

        li $t4, 0       # Initialize counter for reverse index

    palindromeLoop:
        beqz $t2, isPalindromeEnd  # Branch if entire string has been checked

        lbu $t5, 0($t0)     # Load a byte from the original input
        lbu $t6, 0($t1)     # Load a byte from the reverse input

        bne $t5, $t6, notPalindrome   # Branch if characters don't match

        addi $t0, $t0, 1    # Increment the original input address
        subi $t1, $t1, 1    # Decrement the reverse input address

        subi $t2, $t2, 1    # Decrement the index
        addi $t4, $t4, 1    # Increment the counter

        j palindromeLoop    # Jump to palindromeLoop

    isPalindromeEnd:
        beqz $t4, notPalindrome   # Branch if no characters were checked

        li $v0, 1     # Print integer syscall
        move $a0, $t4   # Move the counter to $a0
        syscall

        move $v0, $zero    # Return 0 (not a palindrome)
        jr $ra

notPalindrome:
    move $v0, $zero    # Return 0 (not a palindrome)
    jr $ra

isDuplicate:
    move $t0, $a0    # Save the input address
    move $t1, $zero  # Initialize index to 0

    duplicateLoop:
        beqz $t1, notDuplicate   # Branch if no palindromes stored yet

        la $t2, palindromes   # Load the palindromes array address
        add $t2, $t2, $t1     # Add index offset to the array address

        move $a0, $t0    # Move the input address to $a0
        move $a1, $t2    # Move the current palindrome address to $a1
        jal isSameString

        beqz $v0, notDuplicate   # Branch if strings are not the same

    duplicate:
        move $v0, $t1   # Return 1 (duplicate)
        jr $ra

    notDuplicate:
        addi $t1, $t1, 100   # Increment the index by 100 (size of each palindrome)
        bltz $t1, duplicate   # Branch if index exceeds the maximum number of palindromes

        j duplicateLoop    # Jump to duplicateLoop

storePalindromeInMemory:
    la $t0, palindromes    # Load the palindromes array address
    la $t1, numPalindromes   # Load the numPalindromes address
    lw $t2, 0($t1)     # Load the current number of palindromes

    add $t3, $t0, $t2   # Add the number of palindromes to the array address

    move $t4, $a0    # Save the input address
    move $t5, $t3    # Save the current palindrome address

    storeLoop:
        lbu $t6, 0($t4)     # Load a byte from the input

        sb $t6, 0($t5)      # Store the byte in the palindrome array

        addi $t4, $t4, 1    # Increment the input address
        addi $t5, $t5, 1    # Increment the palindrome address

        beqz $t6, storeEnd   # Branch if end of string is reached

        j storeLoop   # Jump to storeLoop

    storeEnd:
        addi $t2, $t2, 100   # Increment the number of palindromes by 100
        sw $t2, 0($t1)   # Store the updated number of palindromes

        li $v0, 4     # Print string syscall
        la $a0, palindromeStoredMsg
        syscall

        li $v0, 4     # Print string syscall
        move $a0, $a1   # Move the palindrome address to $a0
        syscall

        move $v0, $zero    # Return 0
        jr $ra

isSameString:
    move $t0, $a0    # Save the first string address
    move $t1, $a1    # Save the second string address

    stringLoop:
        lbu $t2, 0($t0)     # Load a byte from the first string
        lbu $t3, 0($t1)     # Load a byte from the second string

        bne $t2, $t3, stringsDifferent   # Branch if characters don't match

        beqz $t2, stringsSame   # Branch if end of strings is reached

        addi $t0, $t0, 1    # Increment the first string address
        addi $t1, $t1, 1    # Increment the second string address

        j stringLoop   # Jump to stringLoop

    stringsSame:
        move $v0, $one   # Return 1 (same strings)
        jr $ra

    stringsDifferent:
        move $v0, $zero    # Return 0 (different strings)
        jr $ra

exit:
    li $v0, 10    # Exit syscall
    syscall

