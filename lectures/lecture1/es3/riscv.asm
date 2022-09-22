.data
A:	.word 5
B:	.word 7
C:	.word 12

RES1:	.space 4
RES2:	.space 4
RES3:	.space 4

.text
.globl MAIN
MAIN:	# res1 = a + b - c - a
	la t0, A
	lw t1, 0(t0)
	
	la t0, B
	lw t2, 0(t0)
	
	add t1, t1, t2		# a + b
	
	la t0, c
	lw t2, 0(t0)
	sub t1, t1, t2		# a + b -c
	
	la t0, A
	lw t2, 0(t0)
	sub t1, t1, t2		# a + b - c - a
	
	
	la t0, RES1		# Save result in memory
	sw t1, 0(t0)
	
	
	# res2 = a + (b - (c - a))
	la t0, A
	lw t1, 0(t0)
	la t0, B
	lw t2, 0(t0)
	la t0, C
	lw t3, 0(t0)
	la t0, A
	lw t4,0(t0)
	sub t3, t3, t4
	sub t2, t2, t3
	add t1, t1, t2
	la t0, RES2
	sw t1, 0(t0)
	
	
	# res3 = a + b * c - a
	la t0, A
	lw t1, 0(t0)
	la t0, B
	lw t2, 0(t0)
	la t0, C
	lw t3, 0(t0)
	mul t2, t2, t3	
	add t1, t1, t2	
	la t0, A
	lw t2, 0(t0)
	sub t1, t1, t2
	la t0, RES3
	sw t1, 0(t0)
	
	
END:	li a7, 10
	ecall
	
	
# Load operands in order and when possible do calculations, the compiler would optimize the calculations
	
	