all: build

build:
	gnatmake main.adb

run: build
	./main

clean:
	rm -f *.o *.ali main