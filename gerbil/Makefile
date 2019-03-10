embedded_scheme: scmlib.ss embedded_scheme.c
	gxc -v -d . -s -S -static -exe -o scmlib scmlib.ss
	sed -i '/apply\s.*main/d' scmlib.scm
	gambitc -link -e '(include "/opt/gerbil-scheme-git/lib/static/gx-gambc#.scm")' scmlib.scm
	gcc -g -c -oscmlib.o -D___LIBRARY scmlib.c
	gcc -g -c -oscmlib_.o -D___LIBRARY scmlib_.c
	gcc -g -std=c99 -Wall -Wextra -pedantic -oembedded_scheme embedded_scheme.c scmlib.o scmlib_.o -L/usr/lib/gambit-c -lgambit -lm -ldl -lutil -lz

.PHONY: clean
clean:
	rm -f scmlib.c
	rm -f scmlib_.c
	rm -f scmlib.scm
	rm -f scmlib__0.scm
	rm -f scmlib__rt.scm
	rm -f scmlib.ssi
	rm -fr static/
	rm -f *.o*
	rm -f embedded_scheme
