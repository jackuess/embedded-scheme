main: scmlib.scm embedded_scheme.c
	chicken-csc -ec scmlib.scm
	gcc -g -std=c99 -W -Wextra -pedantic -oembedded_scheme embedded_scheme.c scmlib.o -lchicken  # -Werror

.PHONY: clean
clean:
	rm -f *.o
	rm -f embedded_scheme
