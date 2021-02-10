# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
	li $v0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 5
	li $t5, 3
	j loop

loop:
	bge $t1, $t4, end

	sll $t2, $a0, 1
	add $v0, $v0, $t2
	sub $v0, $v0, $a1

	move $t3, $a0

	addi $a0, $a0, 1
	addi $t1, $t1, 1

	bge $t3, $t5, yminus

	j loop

yminus:
	addi $a1, $a1, -1
	j loop

end:
	jr $ra

main:

	li $a0, 5
	li $a1, 7
	jal conv

	li $t0, 0
	move $t0, $v0

	li $v0, 1
	move $a0, $t0
	syscall

exit:
	li $v0, 10
	syscall
