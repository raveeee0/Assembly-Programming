.data				# Global variable declaration
A:	.word 1
B:	.word 2
C:	.word 3

.text
.globl 	MAIN
MAIN:
IF:	la t0, A		# Load A address in t0
	lw t1, 0(t0)		# Load A value from t0
	
	la t0, B		# Loading B value in t2...
	lw t2, 0(t0)
	
	bne t1, t2, ELSE	# I alread can evaluate the first condition (optimization)
	
	la t0, C		# Loading C value in t3...
	lw t3, 0(t0)
	
	bne t1, t3, ELSE	# Second condition

THEN:	la t0, A		# Value in registers may be changed, reloading value
	lw t1, 0(t0)
	
	addi t1, t1, 1		# a++
	sw t1, 0(t0)		# Store the changed value immediately (in A address)
	
	j END_IF		# Unconditional jump
	
ELSE:	la t0, B		# Load value
	lw t1, 0(t0)
	
	addi t1, t1, 1		# Change and save
	sw t1, 0(t0)
	
END_IF:	la t1, C
	li t0, 12		# I do not load the value in a register because i dont need to read the value
	sw t0, 0(t1)
	
	li a7, 10		# Program termination service: status code 0
	ecall
	
	
	
	
	
	