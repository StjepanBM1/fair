
GFC=gfortran
FCF=-Wno-conversion

override BIN := fair
override FSF := $(shell find ./ -type f -name '*.f90')
override OBJ := $(FSF:.f90=.o)

.PHONY: all
all: $(BIN)

$(BIN): $(OBJ)
	$(GFC) -o $@ $(OBJ)

%.o: %.f90
	$(GFC) $(FCF) -c $< -o $@

.PHONY: clean
clean:
	rm $(OBJ) $(BIN)

