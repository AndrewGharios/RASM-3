	.data
szS1:	.asciz	"Cat in the hat."
szS2:	.asciz	"Green eggs and ham."
szS3:	.asciz	"cat in the hat."

szS1Length:		.asciz "s1.length() = "
szS2Length:		.asciz "\ns2.length() = "
szS3Length:		.asciz "\ns3.length() = "
szS1S3Equals:	.asciz "\nString_equals(s1,s3) = "
szS1S1Equals:	.asciz "\nString_equals(s1,s1) = "

//temp
szTrue:		.asciz "TRUE"
szFalse:	.asciz "FALSE"

szBool:		.skip 1
szSkip:		.skip 20
chEndl:		.byte 10

	.global _start
	.text
	
_start:	

// ========================== String_length ========================== //
// -------------------------- 	  szS1		-------------------------- //
	ldr x0, =szS1Length	// loads address of szS1Length into x0
	bl	putstring		// branch and link function putstring

	ldr x0, =szS1		// loads address of szS1 into x0
	bl	String_length	// branch and link function String_length
	
	ldr x1, =szSkip		// loads address of szSkip into x1
	bl	int64asc		// branch and link function int64asc
	
	ldr x0, =szSkip		// loads address of szSkip into x0
	bl	putstring		// branch and link function putstring
	
// -------------------------- 	  szS2		-------------------------- //
	ldr x0, =szS2Length	// loads address of szS2Length into x0
	bl	putstring		// branch and link function putstring

	ldr x0, =szS2		// loads address of szS2 into x0
	bl	String_length	// branch and link function String_length
	
	ldr x1, =szSkip		// loads address of szSkip into x1
	bl	int64asc		// branch and link function int64asc
	
	ldr x0, =szSkip		// loads address of szSkip into x0
	bl	putstring		// branch and link function putstring
	
// -------------------------- 	  szS3		-------------------------- //
	ldr x0, =szS3Length	// loads address of szS3Length into x0
	bl	putstring		// branch and link function putstring

	ldr x0, =szS3		// loads address of szS3 into x0
	bl	String_length	// branch and link function String_length
	
	ldr x1, =szSkip		// loads address of szSkip into x1
	bl	int64asc		// branch and link function int64asc
	
	ldr x0, =szSkip		// loads address of szSkip into x0
	bl	putstring		// branch and link function putstring
	
	ldr x0, =chEndl		// loads address of chEndl into x0
	bl  putch			// branch and link function putch
	
// ========================== String_equals ========================== //
	ldr x0, =szS1S3Equals	// loads address of szS1S3Equals into x0
	bl	putstring			// branch and link function putstring

	ldr x1,	=szS1			// loads address of szS1 into x1
	ldr x2, =szS3			// loads address of szS3 into x2
	bl	String_equals		// branch and link function String_equals
	//b	booltoasc			// branch and link function booltoasc
	
	cmp x0,	#1
	bne false
	
	ldr x0,=szTrue
	bl putstring
	b exit
	
false:
	ldr x0,=szFalse
	bl	putstring
	
exit:
	mov x0, #0		// use 0 return code
	mov x8, #93		// service command code 93 terminates this program
	svc 0			// call linux to terminate this program
	
	.end
	