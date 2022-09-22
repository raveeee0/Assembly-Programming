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
		la t0, A						# Load A address in t0
		sw a0, 0(t0)
		
		li a7, 4						# Print output
		la a0, OUTPUT_STR
		ecall
		
		li a7, 1						#Print integer service
		lw a0, A
		ecall
		
		li a7, 4						# Print endline character
		la a0, ENDLINE
		ecall

		li a7, 93						# Exit program service
		li a0, 0
		ecall				