    .text
    .globl  main
main:
    addi    x10, x10, -12
    addi    x12, x0, 2021
    sub     x11, x12, x11
    add     x11, x11, x11 ; *2
    add     x11, x11, x11 ; *4
    add     x12, x11, x11 ; *8
    add     x11, x11, x12 ; *4 + *8 = *12
    addi    x11, x11, 5
    add     x10, x10, x11
