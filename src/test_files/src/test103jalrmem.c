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
    int target;
    asm volatile ("la %0, _exit" : "=r"(target));
    asm volatile ("jalr %0, 0" :: "r"(target));
    int x = 120;
    int y = 230;
    int z = x + y;
}
