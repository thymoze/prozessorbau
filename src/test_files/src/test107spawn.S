    .text
    .globl  main
main:
    la      a0, thread
    csrw    0x701, a0
    csrw    0x702, a0
    csrw    0x703, a0

    jal     ra, thread

_exit:
    j _exit

thread:
    csrr    a0, 0x71D
    addi    a0, a0, 1
    ret
