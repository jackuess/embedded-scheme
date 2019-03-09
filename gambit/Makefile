embedded_scheme: scmlib.scm embedded_scheme.c
	gambitc -link scmlib.scm
	gcc -g -c -oscmlib.o -D___LIBRARY scmlib.c
	gcc -g -c -oscmlib_.o -D___LIBRARY scmlib_.c
	gcc -g -std=c99 -Wall -Wextra -pedantic -oembedded_scheme embedded_scheme.c scmlib.o scmlib_.o -L/usr/lib/gambit-c -lgambit -lm -ldl -lutil

.PHONY: clean
clean:
	rm -f scmlib.c
	rm -f scmlib_.c
	rm -f *.o
	rm -f embedded_scheme
