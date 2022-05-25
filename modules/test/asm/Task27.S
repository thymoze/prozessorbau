    .text
    .globl  main
main:
    add     x12, x0, 15
    sra		x12, x12, 2
    sll		x12, x12, 2
    add		x13, x0, -10
    sra		x13, x13, 2
    sll		x13, x13, 2
    add		x14, x0, 15
    srl		x14, x14, 2
    sll		x14, x14, 2
    add		x15, x0, -10
    srl		x15, x15, 2
    sll		x15, x15, 2
    
    sub 	x11, x11, x10
    sub		x11, x11, x10
    sub		x16, x10, x11
