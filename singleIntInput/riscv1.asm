		.data
INPUT_STR:	.asciz 		"Inserisci un numero: "			# Strings to be printed...
OUTPUT_STR:	.asciz		"Il numero inserito è: "
ENDLINE:	.asciz		"\n"
A:		.space 4
		.text
MAIN:		li a7, 4						# Print service
		la a0, INPUT_STR
		ecall
		
		li a7, 5						# Integer input service
		ecall
		mv t0, a0						# Store integer in t0
		
		li a7, 4						# Print output
		la a0, OUTPUT_STR
		ecall
		
		li a7, 1						#Print integer service
		addi a0, t0, 0
		ecall
		
		li a7, 4						# Print endline character
		la a0, ENDLINE
		ecall

		li a7, 93						# Exit program service
		li a0, 0
		ecall				