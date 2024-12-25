# Compilers
CXX = g++
CXXF = -w
FC = gfortran
FCF = -w -J $(BUILD) -I $(BUILD)
ITRF = -lgfortran

# Directories
FINAL = ./
BUILD = build/
SRC = ./

# C++ and Fortran interoperability using nD arrays template
$(FINAL)driver: $(BUILD)driver.o $(BUILD)farray.o $(BUILD)farrayimp.o $(BUILD)slla.o
	$(CXX) $(CXXF) -o $(FINAL)driver $(BUILD)driver.o $(BUILD)farrayimp.o $(BUILD)farray.o $(BUILD)slla.o $(ITRF)
$(BUILD)driver.o: $(SRC)driver.cpp
	$(CXX) $(CXXF) -o $(BUILD)driver.o -c $(srC)driver.cpp
$(BUILD)farray.o: $(SRC)farray.cpp
	$(CXX) $(CXXF) -o $(BUILD)farray.o -c $(SRC)farray.cpp
$(BUILD)farrayimp.o: $(SRC)farrayimp.f90 $(BUILD)singly_linked_list_of_arrays.mod
	$(FC) $(FCF) -o $(BUILD)farrayimp.o -c $(SRC)farrayimp.f90
$(BUILD)slla.o $(BUILD)singly_linked_list_of_arrays.mod: $(SRC)slla.f90
	$(FC) -w -o $(BUILD)slla.o -c $(SRC)slla.f90

#TODO: check how to access fortran modules in other directories (change dir with -J dir)
