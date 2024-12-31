class Farray{
	protected:
		int pos;						//global linked list position

		Farray();						//default constructor
		Farray(const Farray &far);		//copy constructor
		//~Farray();					//finalizer
};

template <typename datp> class Farray1D : public Farray{
	private:
		int size;

	public:
		Farray1D<datp>(int size);		//constructor with size

		bool set(int rank, datp member);		//change element at rank
		datp get(int rank);					//return element at rank
		bool resize(int size);				//dynamic array resize 
		//method to set first index
};

//separate reshape functions (takes 1D returns nD)

extern "C" {	//Fortran 1D functions
	//1D farray creation
	void cdf1(int* size, int* pos);
	void cif1(int* size, int* pos);
	// void cbf1(int* size, int* pos);
	// void ccf1(int* size, int* pos);

	//1D farray element setters
	// bool sdf1(int* rank, double* member, int* pos);

	//1D farray element getters
	// double gdf1(int* rank, int* pos);
}
