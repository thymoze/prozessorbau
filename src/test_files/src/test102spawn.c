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
    "_spawn:\n\t"
    "li sp, 0x7000\n\t"
    "j spawn\n\t"
);

int main()
{
    int target;
    asm volatile ("la %0, _spawn" : "=r"(target));
    asm volatile ("csrw 0x701, %0" :: "r"(target));
    int x = 120;
    int y = 230;
    int z = x + y;
}

void spawn()
{
    asm volatile ("li x10, 0x12345");
}
