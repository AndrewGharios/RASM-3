	.data
szS1:	.asciz	"Cat in the hat."
szS2:	.asciz	"Green eggs and ham."
szS3:	.asciz	"cat in the hat."

// used in output
szS1Length:			.asciz "s1.length() = "
szS2Length:			.asciz "\ns2.length() = "
szS3Length:			.asciz "\ns3.length() = "
szCopyLine1:		.asciz "\ns4 = String_copy(s1)"
szCopyLine2:		.asciz "\ns1 = "
szCopyLine3:		.asciz "\ns4 = "
szS1S3Equals:		.asciz "\nString_equals(s1,s3) = "
szS1S1Equals:		.asciz "\nString_equals(s1,s1) = "
szS1S3EqualsIgn:	.asciz "\nString_equalsIgnoreCase(s1,s3) = "
szS1S2EqualsIgn:	.asciz "\nString_equalsIgnoreCase(s1,s2) = "
szCharAt:			.asciz "\nString_charAt(s2,4) = "
szSubstring1:		.asciz "\nString_substring_1(s3,4,14) = "
szSubstring2:		.asciz "\nString_substring_2(s3,7) = "
szStartsWith1:		.asciz "\nString_startsWith_1(s1,11,\"hat.\") = "
szStartsWith2:		.asciz "\nString_startsWith_1(s1,\"Cat\") = "
szEndsWith:			.asciz "\nString_endsWith(s1,\"in the hat.\") = "

szHat:		.asciz "hat."
szCat:		.asciz "Cat"
szInTheHat:	.asciz "in the hat."

szS4:		.skip 30
szChar:		.skip 1
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
// -------------------- 	  szS1 and szS3		-------------------- //
	ldr x0, =szS1S3Equals	// loads address of szS1S3Equals into x0
	bl	putstring			// branch and link function putstring

	ldr x1,	=szS1			// loads address of szS1 into x1
	ldr x2, =szS3			// loads address of szS3 into x2
	bl	String_equals		// branch and link function String_equals
	
// -------------------- 	  szS1 and szS1		-------------------- //
	ldr x0, =szS1S1Equals	// loads address of szS1S3Equals into x0
	bl	putstring			// branch and link function putstring

	ldr x1,	=szS1			// loads address of szS1 into x1
	ldr x2, =szS1			// loads address of szS3 into x2
	bl	String_equals		// branch and link function String_equals
	
	ldr x0, =chEndl			// loads address of chEndl into x0
	bl  putch				// branch and link function putch
	
// ========================== String_equalsIgnoreCase ========================== //
// -------------------------- 	  szS1 and szS3		-------------------------- //
	ldr x0, =szS1S3EqualsIgn	// loads address of szS1S3EqualsIgn into x0
	bl	putstring				// branch and link function putstring
	
	ldr x1,	=szS1				// loads address of szS1 into x0
	ldr x2, =szS3				// loads address of szS3 into x0
	bl	String_equalsIgnoreCase	// branch and link to function String_equalsIgnoreCase
	
// -------------------------- 	  szS1 and szS2		-------------------------- //
	ldr x0, =szS1S2EqualsIgn	// loads address of szS1S2EqualsIgn into x0
	bl	putstring				// branch and link function putstring
	
	ldr x1,	=szS1				// loads address of szS1 into x0
	ldr x2, =szS2				// loads address of szS2 into x0
	bl	String_equalsIgnoreCase // branch and link to function String_equalsIgnoreCase
	
	ldr x0, =chEndl				// loads address of chEndl into x0
	bl  putch					// branch and link function putch
	
// ========================== String_copy ========================== //
	ldr x0, =szCopyLine1	// loads address of szCopyLine1 into x0
	bl	putstring			// branch and link to function putstring
	ldr x0, =szS1			// loads address of szS1 into x0
	ldr x1, =szS4			// loads address of szS4 into x0
	bl	String_copy			// branch and link to function String_copy
	
	ldr x0, =szCopyLine2	// loads address of szCopyLine2 into x0
	bl	putstring			// branch and link to function putstring
	ldr x0, =szS1			// loads address of szS1 into x0
	bl 	putstring			// branch and link to function putstring

	ldr x0, =szCopyLine3	// loads address of szCopyLine3 into x0
	bl	putstring			// branch and link to function putstring
	ldr x0, =szS4			// loads address of szS1 into x0
	bl 	putstring			// branch and link to function putstring
	
	ldr x0, =chEndl			// loads address of chEndl into x0
	bl  putch				// branch and link function putch

// ========================== String_charAt ========================== //
	ldr x0, =szCharAt	// loads address of szCharAt into x0
	bl	putstring		// branch and link to function putstring
	
	ldr x0, =szS2		// loads address of szS2 into x0
	mov x1, #4			// moves the value 4 into x1
	bl	String_charAt	// branch and link to function String_charAt
	
	// THANK YOU ANDREW <33333 ALL HAIL KING ANDREW
	ldr  x1, =szChar	// loads address of szChar into x1
	strb w0, [x1]		// stores byte in w0 into address in x1
	
	ldr x0, =szChar		// loads address of szChar into x0
	bl	putch			// branch and link to function putch
	
	ldr x0, =chEndl		// loads address of chEndl into x0
	bl  putch			// branch and link function putch
	
// ========================== String_substring_1 ========================== //
	ldr x0, =szSubstring1	// loads address of szSubstring1 into x0
	bl	putstring			// branch and link to function putstring
	
	ldr x0, =szS3			// loads address of szS3 into x0
	mov x1, #4				// moves the value 7 into x1
	mov x2, #14				// moves the value 14 into x2
	bl	String_substring_1	// branch and link to function String_substring_2
	
// ========================== String_substring_2 ========================== //
	ldr x0, =szSubstring2	// loads address of szSubstring2 into x0
	bl	putstring			// branch and link to function putstring
	
	ldr x0, =szS3			// loads address of szS3 into x0
	mov x1, #7				// moves the value 7 into x1
	bl	String_substring_2	// branch and link to function String_substring_2
	
	ldr x0, =chEndl			// loads address of chEndl into x0
	bl  putch				// branch and link function putch
	
// ========================== String_startsWith_1 ========================== //
	ldr x0, =szStartsWith1	// loads address of szStartsWith1 into x0
	bl	putstring			// branch and link to function putstring
	
	ldr x0, =szS1			// loads address of szS1 into x0
	mov x1, #11				// moves the value 11 ito x1
	ldr x2,	=szHat			// loads address of szHat into x2
	
	bl	String_startsWith_1	// branch and link to function String_startsWith_1

// ========================== String_startsWith_2 ========================== //
	ldr x0, =szStartsWith2	// loads address of szStartsWith2 into x0
	bl	putstring			// branch and link to function putstring
	
	ldr x0, =szS1			// loads address of szS1 into x0
	ldr x1,	=szCat			// loads address of szCat into x1
	
	ldr x0, =chEndl			// loads address of chEndl into x0
	bl  putch				// branch and link function putch

// ========================== String_endsWith ========================== //
	ldr x0, =szEndsWith		// loads address of szEndsWith into x0
	bl	putstring			// branch and link to function putstring
	
	ldr x0, =szS1			// loads address of szS1 into x0
	ldr x1,	=szInTheHat		// loads address of szInTheHat into x1
	
exit:
	mov x0, #0		// use 0 return code
	mov x8, #93		// service command code 93 terminates this program
	svc 0			// call linux to terminate this program
	
	.end
	