    .text
    .globl  main
main:
    csrr    a0, 0x71D
    addi    a0, a0, 1

_exit:
    j _exit

    .balign 0x100
thread1:
    csrr    a0, 0x71D
    addi    a0, a0, 1
    j _exit

    .balign 0x200
thread2:
    csrr    a0, 0x71D
    sll     a0, a0, 2
    j _exit
