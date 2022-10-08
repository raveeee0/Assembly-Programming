.text
.global MAIN
MAIN:	li s0, 1		# Initialize the six values
	li s1, 2
	li s2, 3
	li s3, 4
	li s4, 5
	li s5, 6
	li s6, 7
	
	mv a2, s0		# Prepare them as function parameter
	mv a3, s1
	mv a4, s2
	mv a5, s3
	mv a6, s4
	mv a7, s5
	
	addi sp, sp, -8		# The last one should be saved in the stack
	sd s6, 0(sp)
	
	jal BIG_FUN
	
	addi sp, sp, 8		# Free space (reserved for the last parameter)
	
	mv a7, a0		# Result of computation
	
	li a7, 93		# Exit 0 status
	li a0, 0
	ecall
	
BIG_FUN:
	addi sp, sp, -16	# Save frame pointer and return address
	
	sd fp, 8(sp)		# Save old fp
	
	addi fp, sp, 8		# Now fp points to the beginning of the activation record of BIG_FUN
	sd ra, 0(sp)		# Save return address
	
	addi sp, sp, -48	# Save a, b, c, d, e, f  in the stack
	sd a2, 40(sp)
	sd a3, 32(sp)
	sd a4, 24(sp)
	sd a5, 16(sp)
	sd a6, 8(sp)
	sd a7, 0(sp)
	
	mv a2, a5		# Preparing parameters to call SUMS
	ld a3, 8(fp)		# Load g from the stack
	jal ra, SUMS		# Call SUMS
	
	ld a2, 40(sp)		# Reload values of a, b, c, d, e, f from the stack
	ld a3, 32(sp)
	ld a4, 24(sp)
	ld a5, 16(sp)
	ld a6, 8(sp)
	ld a7, 0(sp)
	
	addi sp, sp, 48		# Deallocate space
	
	add t0, a0, a4		# Computations
	mul t1, a2, a3
	add t2, t1, t0
	add t3, t2, a7
	add a0, t3, a6
	
	ld ra, -8(fp)		# Reaload return address
	addi sp, fp, 8		# Restore sp initial value using fp
	ld fp, 0(fp)		# Restore fp from the stack with fp
	
	jr ra
	
SUMS:
	addi sp, sp, 8 		# Allocate space
	sd fp, 0(sp) 		# Save frame pointer
	mv fp, sp 		# Move frame pointer to beginning of SUMS activation record
	
	mul t0, a0, a1		# Calculations
	addi a0, t0, 17
	
	addi sp, fp, 8		# Deallocate space 
	ld fp, 0(fp) 		# Recover old fp
	
	jr ra			# Return
	
	
	
