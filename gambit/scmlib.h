#ifndef scmlib_h_INCLUDED
#define scmlib_h_INCLUDED

#include <gambit.h>

struct Foo {
    int foo;
    int bar;
    int baz;
};

int foo(void);
___SCMOBJ get_assoc_list(void);
___SCMOBJ get_assoc_list2(void);
___SCMOBJ string_to_symbol(char *symbol);
struct Foo get_struct(void);
void print_struct(struct Foo);

#endif // scmlib_h_INCLUDED

