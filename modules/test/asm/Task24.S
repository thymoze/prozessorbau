    .text
    .globl  main
main:
    addi    x1, x0, -1
	addi	x2, x0, 0x555
	addi    x9, x0, 0xC
	sll     x2, x2, x9
	addi	x2, x2, 0x555
	sll     x2, x2, x9
	addi	x2, x2, 0x555

	xor	    x3, x1, x2
	addi    x4, x3, 0x56
