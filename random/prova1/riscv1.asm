.data
A: .space 8	# LONG a (64 bit)
B: .dword 3	# Store value 3 in B on 64 bit

.text
la t0, B	# Load address of B in t0
ld t1, 0(t0)	# Load value of B in t1
addi t1, t1, 1	# Add 1 to value of B
la t0, A	# Load address of A in t0
sd t0, 0(t1)	# Store the value of computation in A address