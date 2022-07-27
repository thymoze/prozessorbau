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

void get_id()
{
    int id;
    asm volatile ("csrr %0, 0x71D" : "=r"(id));
    id += 1;
    id *= 1000;
    asm volatile ("mv x10, %0" :: "r"(id));
}

int main()
{
    int target;
    asm volatile ("la %0, _thread1" : "=r"(target));
    asm volatile ("csrw 0x701, %0" :: "r"(target));
    get_id();
}

void thread1()
{
    int target;
    asm volatile ("la %0, _thread2" : "=r"(target));
    asm volatile ("csrw 0x702, %0" :: "r"(target));
    get_id();
}

void thread2()
{
    int target;
    asm volatile ("la %0, _thread3" : "=r"(target));
    asm volatile ("csrw 0x703, %0" :: "r"(target));
    get_id();
}

void thread3()
{
    get_id();
}
