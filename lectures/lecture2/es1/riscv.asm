.text
.global MAIN
MAIN: 	li s0, 5		# Load a 
	li s1, 3		# Load b
	
	mv a2, s0		# Prepare a as parameter
	mv a3, s1		# Prepare b as parameter
	jal ra, SUM		# Jump to call the function SUM
	
	add s2, zero, a0	# Save c value from SUM output
	
	li a7, 10		# Return
	ecall	
	

SUM:	addi sp, sp, -8		# Allocate activation record
	sd s0, 0(sp)		# Save s0, we should preserve it because is used in main
	
	add s0, a2, a3		# Sum the two numbers
	mv a0, s0		# Load value as output
	
	ld s0, 0(sp)		# Restore s0 value
	
	addi sp, sp, 8		# De-allocate activation record
	
	jalr zero, 0(ra)	# Return in MAIN function
	