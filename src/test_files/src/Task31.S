    .text
    .globl  main
main:
    lui     x10, 0xfffff
    lui     x11, 0xeffff
    lui     x12, 0xaff0f
    lui     x13, 0x80001
    sub     x10, x10, x11

