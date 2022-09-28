.data
V:	.space 80
PTR: 	.dword 0

.text
.global MAIN
MAIN: 	addi a2, zero, 5	# Load 5 as parameter
	jal ra, FOO		# Jump to FOO function
	
	li a7, 10		# Exit
	ecall
	
FOO:	addi sp, sp, -8		# Save ra in activation record
	sd s0, 0(sp)		# Leave space for counter variable
	
	la t0, V		# I use temp because it is not a local variable
	la t1, PTR		# Load PTR
	sd t0, 0(t1)		# Store the pointer to the first array element to PTR
				
	li s0, 0		# Initialize counter variable I to 0
	li t2, 10		# Limit
	
FOR:	bge s0, t2, END_LOOP

	ld t0, 0(t1)		# Load pointer P in $t0
	ld t1, 0(t0) 		# Load *p, p pointed value

	add t1, t1, a2		# Sum n
	sd t1, 0(t0)		# Save *p
	
	addi t0, t0, 8 		# p++, point to next element
	
	la t1, PTR
	sd t0, 0(t1)		# Save new p
	
	addi s0, s0, 1		# i++
	
	j FOR
	
END_LOOP:
	ld s0, 0(sp)		# Restore s0
	addi sp, sp, 8		# Free memory
	
	jalr zero, 0(ra)	# Return
	
	
	
	

	
	
	
	
	
	
