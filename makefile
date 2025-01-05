# Flag to include when using this library
LIB = -L $(LIBDIR) -I $(LIBDIR) -lfarray -lgfortran

# Compilers
CXX = g++
CXXF = -w
FC = gfortran
FCF = -w -J$(SRC) -I$(SRC)

# Directories
LIBDIR = libdir/
BUILD = build/
SRC = source/

# cleanup (del for windows and rm for linux)
CLNPCMD = del
clean: $(LIBDIR)libfarray.a
	$(CLNPCMD) source\dlla.mod
	$(CLNPCMD) source\farrayimp1d.mod
	$(CLNPCMD) build\dlla.o
	$(CLNPCMD) build\farrayimp1D.o

# library creation
$(LIBDIR)libfarray.a: $(BUILD)farrayimp1D.o $(BUILD)dlla.o
	ar rcs $(LIBDIR)libfarray.a $(BUILD)farrayimp1D.o $(BUILD)dlla.o
$(BUILD)farrayimp1D.o: $(SRC)farrayimp1D.f90 $(SRC)dlla.mod
	$(FC) $(FCF) -o $(BUILD)farrayimp1D.o -c $(SRC)farrayimp1D.f90
$(BUILD)dlla.o $(SRC)dlla.mod: $(SRC)dlla.f90
	$(FC) $(FCF) -o $(BUILD)dlla.o -c $(SRC)dlla.f90
