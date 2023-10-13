//@ Subroutine String_Length: Provided a pointer to a null terminated string, String_Length
//@							  will return the length of the string in X0
//@ X0: Must point to a null terminated string
//@ LR: Must contain the return address
//@ All AAPCS required registers are preserved, r19-r29 and SP.
//@ X0 is not preserved.

	.data
	.global String_length
	.text
	
String_length:
	// preserving registers x19-x30 (AAPACS)
	str x19, [sp, #-16]!
	str x20, [sp, #-16]!
	str x21, [sp, #-16]!
	str x22, [sp, #-16]!
	str x23, [sp, #-16]!
	str x24, [sp, #-16]!
	str x25, [sp, #-16]!
	str x26, [sp, #-16]!
	str x27, [sp, #-16]!
	str x28, [sp, #-16]!
	str x29, [sp, #-16]!
	str lr, [sp, #-16]!
	mov x29, sp		// setting stack frame

	mov x19, #0	// sets counter (x19) to 0
	mov x20, x0	// moves string address to x20
	
	ldrb w21, [x20]		// gets a byte from the pointer
	
loop:
	cmp w21, #0			// compares the byte to NULL
	beq endloop			// if w21 == NULL, jumps to endloop
	
	add x19, x19, #1	// x19 = x19 + 1
	ldrb w21, [x20], #1	// gets a byte from the pointer
	
	b loop				// unconditional branch to loop
	
endloop:
	sub x19, x19, #1	// x19 = x19 - 1
	mov x0, x19			// moves the count in x19 into x0

exit:
	// restoring preserved registers x19-x30 (AAPACS)
	ldr lr, [sp], #16
	ldr x29, [sp], #16
	ldr x28, [sp], #16
	ldr x27, [sp], #16
	ldr x26, [sp], #16
	ldr x25, [sp], #16
	ldr x24, [sp], #16
	ldr x23, [sp], #16
	ldr x22, [sp], #16
	ldr x21, [sp], #16
	ldr x20, [sp], #16
	ldr x19, [sp], #16
	
	ret	// returns to calling function
