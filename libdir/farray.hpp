#ifndef FARRAY1D_HPP
#define FARRAY1D_HPP

class Farray{ //Parent
    protected:
        int pos;	//global linked list position
        Farray(){}	//default constructor
};

template <typename datp> class Farray1D : public Farray { //1D Child
	private:
        /// size of array
        int size;

	public:
        /// constructor with size
        Farray1D(int size);
        /// copy constructor
        Farray1D(Farray1D &far);
        /// array constructor
        Farray1D(datp array[], int size);

        /// changes element at rank
        void set(int rank, datp member);
        /// returns element at rank
        datp get(int rank);
        /// returns farray size
        int length();
        /// returns a slice
        Farray1D<datp> slice(int start, int end);
        /// convert farray to array
        datp* tocpp();
};

// reshape functions (takes 1D returns nD)

// display overloads
#include <iostream>
template <typename datp> std::ostream& operator<<(std::ostream& os, Farray1D<datp>& farr);

extern "C" { //Fortran functions
	//1D farray creation
	void cff1(int* size, int* pos);
	void cdf1(int* size, int* pos);
	void cif1(int* size, int* pos);
	void cbf1(int* size, int* pos);
	void ccf1(int* size, int* pos);

	//1D farray element setters
	void sff1(int* rank, float* member, int* pos);
	void sdf1(int* rank, double* member, int* pos);
	void sif1(int* rank, int* member, int* pos);
	void sbf1(int* rank, bool* member, int* pos);
	void scf1(int* rank, char* member, int* pos);

	//1D farray element getters
	float gff1(int* rank, int* pos);
	double gdf1(int* rank, int* pos);
	int gif1(int* rank, int* pos);
	bool gbf1(int* rank, int* pos);
	char gcf1(int* rank, int* pos);
}

#include "farray1D.tpp"

#endif //FARRAYD_HPP
