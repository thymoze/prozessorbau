/* Startup code: do not alter! */
asm(
    ".section \".entry\"\n\t"
    ".global _start\n\t"
    "_start:\n\t"
    "li sp, 0x8000\n\t"
    "jal main\n\t"
    ".global _exit\n\t"
    "_exit:\n\t"
    "j _exit\n\t"
);

int main()
{
    register int id;
    asm volatile ("csrr %0, 0x71D" : "=r"(id));
    id += 1;
    id *= 1000;
    return id;
}
