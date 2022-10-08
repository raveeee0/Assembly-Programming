.eqv N, 10

.data
VECT:	.space 80

.text
.global MAIN
MAIN:	la a2, VECT
	li a3, N
	
	jal ra, CLEAR_ARRAY
	
	li a7, 93
	li a0, 0
	ecall
	
CLEAR_ARRAY:
	addi sp, sp, -24
	
	sd ra, 16(sp)
	sd s1, 8(sp)
	sd s0, 0(sp)
	
	la s0, VECT		# Pointer p to the first array element
	
	# Creating constant "array + size"
	li t0, N		# Load size
	slli t1, t0, 3		# Multiply by 8, t1 = 80	
	add s1, t1, s0		# Array + size
	
FOR:	bge s0, s1, END_FOR
	
	sd zero, 0(s0)		# Store 0 in address pointed by p (*p = 0)
	
	addi s0, s0, 8		# p++
	
	j FOR
	
END_FOR:
	ld s0, 0(sp)
	ld s1, 8(sp)
	ld ra, 16(sp)
	
	jr ra