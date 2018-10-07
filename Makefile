CC=gcc
CFLAGS=-I. -Ilibsailing -std=gnu99 $(shell pkg-config --libs --cflags jansson) -lpthread -Wall -lm
DEPS =
OBJ = sailsd.o logging.o
LIBSAILING_OBJ = libsailing/sailing.o libsailing/physics.o libsailing/wind.o libsailing/boat.o

INSTALL_PATH?=/usr/local

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

sailsd: $(OBJ) $(LIBSAILING_OBJ)
	gcc -o $@ $^ $(CFLAGS)

install:
	mkdir -pv $(INSTALL_PATH)/bin
	cp sailsd $(INSTALL_PATH)/bin/sailsd

clean:
	rm -v *.o libsailing/*.o

fmt:
	clang-format -i *.[ch]
