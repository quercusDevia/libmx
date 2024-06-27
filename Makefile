FLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic

all: libmx.a

libmx.a: objFiles
	@ar rcs $@ obj/*.o

objFiles: src/*.c inc/libmx.h
	@mkdir -p obj
	clang $(FLAGS) -c src/*.c -Iinc
	mv *.o obj/

clean:
	@rm -rf obj

uninstall:
	@rm -rf libmx.a
	@rm -rf obj

reinstall: uninstall libmx.a
