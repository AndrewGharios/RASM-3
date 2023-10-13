//@ Subroutine booltoasc: Provided a pointer to a byte, booltoasc will PRINT a ASCII
//@						  representation of the byte in X0 (TRUE or FALSE)
//@ X0: Must point to a byte
//@ LR: Must contain the return address
//@ All AAPCS required registers are preserved, r19-r29 and SP.
//@ X0 is not preserved.

	.data
szTrue:		.asciz	"TRUE"
szFalse:	.asciz	"FALSE"
	
	.global booltoasc
	.text
	
booltoasc:
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
	str x30, [sp, #-16]!
	mov x29, sp			// setting stack frame
	
	cmp x0, #1			// compares x0 to 1
	bne	false			// if not 1, jumps to false
	
	ldr x0, =szTrue		// loads address of szTrue into x0
	bl	putstring		// branch and link function putstring
	b exit				// unconditional branch to exit
	
false:
	ldr x0, =szFalse	// loads address of szFalse into x0
	bl	putstring		// branch and link function putstring
	b exit
	
exit:
	// restoring preserved registers x19-x30 (AAPACS)
	ldr x30, [sp], #16
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
	