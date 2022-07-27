    .text
    .globl  main
main:
    csrr    a0, 0x71D
    addi    a0, a0, 1
