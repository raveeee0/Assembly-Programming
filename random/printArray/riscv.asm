.data

.eqv	N, 10
VECT:	.dword	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
STR_TAB:.asciz 	"\t"

.text
.global MAIN
MAIN:	la a2, VECT
	jal ra, PRINT_ARR	# Call to subroutine
	
	li a7, 93		# Exit
	li a0, 0
	ecall
	
PRINT_ARR:
	addi sp, sp, -16	# Record frame
	sd ra, 8(sp)
	sd s0, 0(sp)
	
	li s0, 0
	
FOR:	li t0, N			
	bge s0, t0, END_FOR	# Check condition

	slli t0, s0, 3		# Element memory address
	add t0, t0, a2
	ld a0, 0(t0)
	
	li a7, 1		# Print element
	ecall
	
	la a0, STR_TAB		# Print tab
	li a7, 4
	ecall
	
	addi s0, s0, 1		# Increment variable
	j FOR			# Continue with loop
	
END_FOR:
	ld ra, 8(sp)
	ld s0, 0(sp)
	addi sp, sp, 16		# Deallocate space
	
	jr ra			# Return
