		.data
OUT_STRING:	.asciz		"Hello World!\n"
		.text
MAIN:		li, a7, 4				# Print string service code number
		la a0, OUT_STRING			# Address of string to be printed in a0
		ecall					# System call
EXIT:		li a7, 93				# Exit service code number
		li a0, 0				# Exit number to return
		ecall					# System call