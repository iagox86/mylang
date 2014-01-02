all: mylang

mylang: mylang.yy.c mylang.tab.c mylang_interpreter.c
	gcc -Wall -omylang mylang.yy.c mylang.tab.c mylang_interpreter.c

mylang.yy.c: mylang.l mylang.tab.c
	flex -o mylang.yy.c mylang.l

mylang.tab.c: mylang.y
	bison -d -o mylang.tab.c mylang.y

clean:
	rm -f lex.yy.c mylang.yy.c mylang *.tab.c *.tab.h


