.data
V:	.space 40
PTR: 	.dword 0

.text
.global MAIN
MAIN: 	addi a2, zero, 5	# Load 5 as parameter
	jal ra, FOO		# Jump to FOO function
	
	li a7, 10		# Exit
	ecall
	
FOO:	addi sp, sp, -12	# Save ra in actiovation record
	sd ra, 4(sp)		# Leave space for counter variable
	
	la t0, V		# I use temp because it is not a local variable
	la t1, PTR		# Load PTR
	
	sd t0, 0(t1)		# Store the pointer to the first array element to PTR
				
				# Counter variable I is in the stack
	sw zero, 0(sp)		# Initialize to 0
	
FOR:	lw t1, 0(sp)		# Check if condition is valid
	
	li t2, 10
	bge t1, t2, END_LOOP

THEN:	la t0, PTR		# Add n to element pointed by PTR
	ld t1, 0(t0)
	lw t2, 0(t1)
	
	add t2, t2, a2
	sw t0, 0(t2)
	
	
	la t0, PTR		# p++
	ld t1, 0(t0)
	addi t1, t1, 4
	sd t1, 0(t0)
	
	
	lw t1, 0(sp)		# i++
	addi t1, t1, 0
	sw t1, 0(sp)
	
	
END_LOOP:
	ld ra, 4(sp)
	jalr zero, 0(ra)
	
	
	
	

	
	
	
	
	
	