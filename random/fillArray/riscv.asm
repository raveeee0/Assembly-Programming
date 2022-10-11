.eqv N 10

.data
VECTOR: .space	80			# Space for 10 long elements

.text
.global MAIN
MAIN:	li a2, 9
	jal ra, FILL_ARR		# Call Fill Array function
	
FILL_ARR:
	addi sp, sp, -16		# Allocate space on the stack
	sd ra, 8(sp)			
	sd s0, 0(sp)
	
	li s0, 0			# Counter variable
	li t2, N			# Loop limit
	
FOR:	bge s0, t2, END_FOR		# Check condition

	slli t0, s0, 3			# Offset index in bytes
	la t1, VECTOR
	add t0, t0, t1			# Address of i-th element
	sd a0, 0(t0)			# Set i-th element to a0
	
	addi a0, a0, 2			# Increment a0 by 2
	addi s0, s0, 1			# Increment loop counter variable
	
	j FOR				# Loop
	
END_FOR:
	ld ra, 8(sp)			# Restore saved registers
	ld s0, 0(sp)
	addi sp, sp, 16			# Deallocate space
	
	jr ra				# Return to the callee
	
