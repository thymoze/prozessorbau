    .text
    .globl  main
main:
    la      a0, thread1
    csrw    0x701, a0

    la      a0, thread2
    csrw    0x702, a0

    csrr    a0, 0x71D
    addi    a0, a0, 1
    sll     a0, a0, 4

_exit:
    j _exit

thread1:
    csrr    a0, 0x71D
loop:
    addi    a0, a0, 1
    j       loop

thread2:
    csrr    a0, 0x71D
    addi    a0, a0, 1
    ret
