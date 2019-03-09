#include <alloca.h>
#include <stdio.h>

#include <chicken/chicken.h>

extern int foo(int xyz);

int main(void) {
    CHICKEN_run((void*)C_toplevel);
    int ret = foo(22);
    printf("ret: %d\n", ret);
    return 1;
}
