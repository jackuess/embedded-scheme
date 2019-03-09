#include <stdio.h>

#define ___VERSION 409003
#define __USE_POSIX
#include <gambit.h>

extern int foo(void);
extern ___SCMOBJ get_assoc_list(void);
extern ___SCMOBJ get_assoc_list2(void);
extern ___SCMOBJ string_to_symbol(char *symbol);

#define SCHEME_LIBRARY_LINKER ___LNK_scmlib____0__

___BEGIN_C_LINKAGE
    extern ___mod_or_lnk SCHEME_LIBRARY_LINKER (___global_state);
___END_C_LINKAGE

void init_gambit() {
    ___setup_params_struct setup_params;
    ___setup_params_reset (&setup_params);

    setup_params.version = ___VERSION;
    setup_params.linker = SCHEME_LIBRARY_LINKER;

    ___setup (&setup_params);
}

void cleanup_gambit() {
    ___cleanup();
}

int main(void) {
    printf("Hello World, this is from C\n");

    init_gambit();

    int item = foo();
    printf("%d\n", item);

    ___SCMOBJ ___err = ___FIX(___NO_ERR);

    ___SCMOBJ lst = get_assoc_list();
    while (___PAIRP(lst)) {
        ___SCMOBJ pair = ___CAR(lst);
        char *key = NULL;
        int val = -1;

        ___SCMOBJ scmkey = ___CAR(pair);
        ___SCMOBJ scmval = ___CDR(pair);
        ___BEGIN_CFUN_SCMOBJ_TO_CHARSTRING(scmkey, key, 1)
        printf("%s: ", key);
        ___END_CFUN_SCMOBJ_TO_CHARSTRING(scmkey, key, 1)
        ___BEGIN_CFUN_SCMOBJ_TO_INT(scmval, val, 1)
        printf("%d\n", val);
        ___END_CFUN_SCMOBJ_TO_INT(scmval, val, 1)

        lst = ___CDR(lst);
    }

    ___SCMOBJ lst2 = get_assoc_list2();
    ___SCMOBJ sym_foo = string_to_symbol("foo");
    ___SCMOBJ sym_bar = string_to_symbol("bar");
    ___SCMOBJ sym_baz = string_to_symbol("baz");
    while (___PAIRP(lst2)) {
        ___SCMOBJ pair = ___CAR(lst2);

        ___SCMOBJ key = ___CAR(pair);
        ___SCMOBJ scmval = ___CDR(pair);

        int val = -1;
        ___BEGIN_CFUN_SCMOBJ_TO_INT(scmval, val, 1);
        if (key == sym_foo) {
            printf("Foo: %d\n", val);
        } else if (key == sym_bar) {
            printf("Bar: %d\n", val);
        } else if (key == sym_baz) {
            printf("Baz: %d\n", val);
        }
        ___END_CFUN_SCMOBJ_TO_INT(scmval, val, 1);

        lst2 = ___CDR(lst2);
    }

    cleanup_gambit();

    return 0;
}
