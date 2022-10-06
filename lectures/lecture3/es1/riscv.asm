.text
.global MAIN
MAIN:	li a2, 2		# Load paramethers
	li a3, 5		# a2 = n, a3 = exp
	
	jal ra, POT		# Call POT function	
	
	li a7, 10		# Exit service
	ecall
	
POT:	addi sp, sp, -8		# Allocate space in stack
	sd ra, 0(sp)		# Save return address

IF:	bne a3, zero, ELSE	# If exp != 0 go to ELSE

	li a0, 1		# Return 1
	j EXIT

ELSE:	addi sp, sp, -8		# I dont know if the callee will modify it (n)
	sd a2, 0(sp)

	addi a3, a3, -1		# Decrement exp
	jal ra, POT		# Call POT function with exp--
	
	ld a2, 0(sp)		# Reaload n from the stack
	addi sp, sp, 8
	
	mul a0, a0, a2		# n * POT

EXIT:	ld ra, 0(sp)		# Reload return address
	addi sp, sp, 8		# Deallocate space
	
	
	jalr zero, 0(ra)	# Return
	
	
	