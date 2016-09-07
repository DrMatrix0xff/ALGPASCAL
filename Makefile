
SRC = $(wildcard *.pas)
OBJ = $(SRC:%.pas=%.o)
BIN = $(SRC:%.pas=%)

%: %.pas
	fpc $^ -o$@

%.o: %.pas

all: compile

compile: $(BIN)

clean:
	rm -f $(OBJ) $(BIN)

.PHONY: clean


