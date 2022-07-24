
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

static const char digit[16] = {
 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71,
};

int main()
{
    int x;
    for (int i = 0; i < 16; i++) {
        x = digit[i];
        int offset;
        asm volatile (
            "li %0, 0x1000"
            : "=g"(offset)
        );
        asm volatile (
            "sw %0, 0(%1)"
            :: "r"(x), "g"(i*sizeof(x)+offset)
        );
    }
}
