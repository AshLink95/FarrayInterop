class Farray{
	protected:
		int pos;						//global linked list position
		Farray();						//default constructor
};

template <typename datp> class Farray1D : public Farray{
	private:
		int size;

	public:
		Farray1D<datp>(int size);			//constructor with size
		Farray1D<datp>(Farray1D &far);		//copy constructor
		Farray1D<datp>(datp array[], int size);	//array constructor

		void set(int rank, datp member);		//change element at rank
		datp get(int rank);					//return element at rank
		int length();						//return farray size
		datp* tocpp();						//convert farray to array
		//TODO: slicing method
		//TODO: resizeing method
};

//TODO: separate reshape functions (takes 1D returns nD)

extern "C" {	//Fortran 1D functions
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

#include "farray.tpp"
