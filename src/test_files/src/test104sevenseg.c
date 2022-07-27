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
    "_thread1:\n\t"
    "li sp, 0x7000\n\t"
    "j thread1\n\t"
    "_thread2:\n\t"
    "li sp, 0x6000\n\t"
    "j thread2\n\t"
    "_thread3:\n\t"
    "li sp, 0x5000\n\t"
    "j thread3\n\t"
);

static const char digit[16] = {
 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71,
};

char seven_seg[4] = {0, 0, 0, 0};

void display_thread_id()
{
    int id;
    asm volatile ("csrr %0, 0x71D" : "=r"(id));
    seven_seg[id] = digit[id];
    asm volatile ("csrw 0x788, %0" :: "r"(seven_seg));
    for (int i = 0; i < 50000; i++) {}
    seven_seg[id] = 0;
}

int main()
{
    display_thread_id();

    int target;
    asm volatile ("la %0, _thread2" : "=r"(target));
    asm volatile ("csrw 0x702, %0" :: "r"(target));

    for (int i = 0; i < 10000; i++);

    unsigned int i=0;
    while (1) {
        seven_seg[0] = digit[(i/20000) % 10];
        asm volatile ("csrw 0x788, %0" :: "r"(seven_seg));
        i++;
    }
}

void thread1()
{
    display_thread_id();
}

void thread2()
{
    display_thread_id();
}

void thread3()
{
    display_thread_id();
}
