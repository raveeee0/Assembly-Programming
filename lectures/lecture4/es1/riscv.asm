.eqv N, 10

.data
VECT:	.space 80

.text
.global MAIN
MAIN:	la a2, VECT		# Load first element of the array as parameter
	li a3, N		# Load N as parameter
	
	jal ra, CLEAR_ARRAY	# Call procedure
	
	li a7, 93		# Exit service
	li a0, 0
	ecall

CLEAR_ARRAY:
	addi sp, sp, -16	# Allocate space
	
	sd ra, 8(sp)		# Save ra and s0 (preserve it for the caller)
	sd s0, 0(sp)
	
	addi s0, zero, 0	# Initialize counter loop variable to 0
	
FOR:	bge s0, a3, END_FOR	# Check loop condition

	li t0, 8		# Load 8 in register (memory is 8 byte)
	mul t1, t0, s0		# Offset from the base of the array obtained by i * 8 (in bytes)
	
	add t2, a2, t1		# Add in t2, the base of the vector and the indexed element
	
	sd zero, 0(t2)		# Clear element array
	
	addi s0, s0, 1		# Increment counter variable i

	j FOR			

END_FOR:
	ld s0, 0(sp)		# Restore s0, ra
	ld ra, 8(sp)
	
	jr ra			# Return