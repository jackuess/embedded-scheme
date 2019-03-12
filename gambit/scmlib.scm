(c-define (c-foo) () int "foo" "extern"
          (display "Foo from Gambit")
          (newline)
          5)

(c-define (c-string->symbol symbol) (char-string) scheme-object "string_to_symbol" "extern"
          (string->symbol symbol))

(c-define (c-get-assoc-list) () scheme-object "get_assoc_list" "extern"
          '(("foo" . 1) ("bar" . 2) ("baz" . 3)))

(c-define (c-get-assoc-list2) () scheme-object "get_assoc_list2" "extern"
          '((foo . 1) (bar . 2) (baz . 3)))

(c-declare #<<c-declare-end

#include "scmlib.h"

___SCMOBJ SCMOBJ_to_FOO (___PSD ___SCMOBJ src, struct Foo *dst, int arg_num) {
    ___SCMOBJ ___err = ___FIX(___NO_ERR);
    if (!___PAIRP(src)) {
        return ___FIX(___UNKNOWN_ERR);
    }

    ___SCMOBJ sym_foo = string_to_symbol("foo");
    ___SCMOBJ sym_bar = string_to_symbol("bar");
    ___SCMOBJ sym_baz = string_to_symbol("baz");
    while (___PAIRP(src)) {
        ___SCMOBJ pair = ___CAR(src);

        ___SCMOBJ key = ___CAR(pair);
        ___SCMOBJ scmval = ___CDR(pair);

        int val = -1;
        if (key == sym_foo) {
            ___BEGIN_CFUN_SCMOBJ_TO_INT(scmval, dst->foo, arg_num);
            ___END_CFUN_SCMOBJ_TO_INT(scmval, dst->foo, arg_num);
        } else if (key == sym_bar) {
            ___BEGIN_CFUN_SCMOBJ_TO_INT(scmval, dst->bar, arg_num);
            ___END_CFUN_SCMOBJ_TO_INT(scmval, dst->bar, arg_num);
        } else if (key == sym_baz) {
            ___BEGIN_CFUN_SCMOBJ_TO_INT(scmval, dst->baz, arg_num);
            ___END_CFUN_SCMOBJ_TO_INT(scmval, dst->baz, arg_num);
        }

        src = ___CDR(src);
    }
    return ___err;
}

___SCMOBJ FOO_to_SCMOBJ (___processor_state ___ps, struct Foo src, ___SCMOBJ *dst, int arg_num) {
    ___SCMOBJ ___err = ___FIX(___NO_ERR);
    ___SCMOBJ foo_scmobj;
    ___SCMOBJ bar_scmobj;
    ___SCMOBJ baz_scmobj;

    ___BEGIN_SFUN_INT_TO_SCMOBJ(src.foo, foo_scmobj, arg_num)
    ___BEGIN_SFUN_INT_TO_SCMOBJ(src.bar, bar_scmobj, arg_num)
    ___BEGIN_SFUN_INT_TO_SCMOBJ(src.baz, baz_scmobj, arg_num)
    *dst = ___EXT(___make_pair) (___ps, foo_scmobj, bar_scmobj);
    if (___FIXNUMP(*dst)) {
        ___err = *dst;
    }
    ___END_SFUN_INT_TO_SCMOBJ(src.foo, foo_scmobj, arg_num)
    ___END_SFUN_INT_TO_SCMOBJ(src.bar, foo_scmobj, arg_num)
    ___END_SFUN_INT_TO_SCMOBJ(src.baz, foo_scmobj, arg_num)

    return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_FOO(src,dst,i) \
if ((___err = SCMOBJ_to_FOO (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_FOO(src,dst,i) }

#define ___BEGIN_CFUN_FOO_to_SCMOBJ(src,dst) \
if ((___err = FOO_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_FOO_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_FOO_to_SCMOBJ(src,dst,i) \
if ((___err = FOO_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_FOO_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_FOO(src,dst) \
{ ___err = SCMOBJ_to_FOO (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_FOO(src,dst) }

c-declare-end
)
(c-define-type c-foo-struct "struct Foo" "FOO_to_SCMOBJ" "SCMOBJ_to_FOO" #f)

(c-define (c-get-struct) () c-foo-struct "get_struct" "extern"
          '((foo . 3) (bar . 2) (baz . 1)))
