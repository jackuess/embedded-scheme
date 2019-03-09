embedded_scheme: scmlib.scm embedded_scheme.c
	gxc -v -gsc-flag -link -d ./ scmlib.scm
	gcc -g -c -oscmlib.o -D___LIBRARY scmlib__0.c
	gcc -g -c -oscmlib_.o -D___LIBRARY scmlib__0_.c
	gcc -g -std=c99 -Wall -Wextra -pedantic -oembedded_scheme embedded_scheme.c scmlib.o scmlib_.o -L/usr/lib/gambit-c -lgambit -lm -ldl -lutil

.PHONY: clean
clean:
	rm -f scmlib__0.c
	rm -f scmlib__0_.c
	rm -f scmlib.ssi
	rm -f *.o*
	rm -f embedded_scheme
