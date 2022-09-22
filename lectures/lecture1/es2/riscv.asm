.data
VETT:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 0		# If not to be initialized I should use  .space <bytes>
MAX:	.space 4
I:	.space 4			# Counter variable

.text
.globl	MAIN
MAIN:	la t0, VETT			# Load first element of the array
	lw t1, 0(t0)
	
	la t2, MAX			# Set MAX value to first element of the array
	sw t1, 0(t2)
	
	la t0, I
	sw zero, 0(t0)			# Assign 0 to counter variable I
	
LOOP:	la t0, I			# Load counter variable I value
	lw t1, 0(t0)
	
	li t2, 10			# Check loop condition
	bge t1, t2, END_LOOP		# Break the loop if I value is >= 10
	
IF:	la t0, VETT			# Load vector address
	la t1, I			
	lw t2, 0(t1)			# Load I value
	
	# To calculate the single element address of the array we use the left logical shift
	slli t2, t2, 2
	add t0, t0, t2
	
	lw t1, 0(t0)			# Pick up the i-nth element
	la t2, MAX
	lw t3, 0(t2)			# Load MAX
	
	ble t1, t3, END_IF		# Jump if element not bigger than MAX
	
THEN:	la t0, MAX			# If bigger save it as new value of MAX
	sw t1, 0(t0)
	
END_IF:	la t0, I			# I ++
	lw t1, 0(t0)
	addi t1, t1, 1			
	sw t1, 0(t0)
	
	j LOOP

END_LOOP:
	li a7, 10
	ecall
	
	