# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	q1: .asciiz "The contents of the array are:\n"
	q2: .asciiz "\n"
	arr: 
		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
printA:
	bge $t0, $a1, end
	move $t1, $a0

	li $v0, 1
	lw $a0, 0($t1)
	syscall

	li $v0, 4
	la $a0, q2
	syscall

	move $a0, $t1
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	j printA

end:
	jr $ra

main:
	li $v0, 4
	la $a0, q1
	syscall

	li $a1, 10
	li $t0, 0
	la $a0, arr
	jal printA

exit:
	li $v0, 10
	syscall
