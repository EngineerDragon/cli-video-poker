CC := gcc
CFLAGS := -std=c99 -I./include
SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c,build/%.o,$(SRC))
EXECUTABLE := cli-video-poker

.PHONY: all debug clean

all: $(EXECUTABLE)

$(EXECUTABLE) : $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LDLIBS)

build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rvf build/*.o $(EXECUTABLE)