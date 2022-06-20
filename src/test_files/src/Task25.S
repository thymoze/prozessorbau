    .text
    .globl  main
main:
    add     x13, x0, 12   # 
    sub		x10, x13, x10 # 12 - x
    addi    x12, x0, 2021
    sub     x11, x12, x11 # m = 2021 - y
    add     x11, x11, x11 # m * 2
    add     x11, x11, x11 # m * 4
    add     x12, x11, x11 # m * 8
    add     x11, x11, x12 # m * 4 + m * 8
    addi    x11, x11, 5   # 12m + 5
    add     x10, x10, x11 # 12 - x + 12m + 5
