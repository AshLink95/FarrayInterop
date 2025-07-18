.PHONY: build clean test

# Flag to include when using this library
LIB = -L$(LIBDIR) -I$(LIBDIR) -lfarray -lgfortran

# Compilers
CXX = g++
CXXF = -w
FC = gfortran
FCF = -w -J$(BUILD) -I$(BUILD)

# Directories
LIBDIR = libdir/
BUILD = build/
SRC = src/
TEST = tests/

# library creation
build: $(BUILD)farrayimp1D.o $(BUILD)dlla.o
	ar rcs $(LIBDIR)libfarray.a $(BUILD)farrayimp1D.o $(BUILD)dlla.o

$(BUILD)farrayimp1D.o: $(SRC)farrayimp1D.f90 $(BUILD)dlla.mod
	mkdir -p $(BUILD)
	$(FC) $(FCF) -o $(BUILD)farrayimp1D.o -c $(SRC)farrayimp1D.f90

$(BUILD)dlla.o $(BUILD)dlla.mod: $(SRC)dlla.f90
	mkdir -p $(BUILD)
	$(FC) $(FCF) -o $(BUILD)dlla.o -c $(SRC)dlla.f90

# cleanup (del for windows and rm for linux)
clean: 
	rm -rf $(BUILD)

# tests
test: $(BUILD)tests/test1D
	./$(BUILD)tests/test1D

$(BUILD)tests/test1D:
	mkdir -p $(BUILD)tests/
	g++ -std=c++20 -o $(BUILD)tests/test1D $(TEST)test1D.cpp $(LIB) -lgtest -lgtest_main
