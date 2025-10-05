asm("li sp, 0x100000"); // SP set to 1 MB
asm("jal main"); // call main
asm("mv a1, a0"); // save return value in a1
asm("li a7, 10"); // prepare ecall exit
asm("ecall"); // now your simulator should stop
int main() {
    int n = 0;
    int k = 4;
    for(int i=0; i<10; i++){
        n += k;
    }
    return 0;
}