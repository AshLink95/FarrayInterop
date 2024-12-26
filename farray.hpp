class Farray{
	protected:
		int pos;						//global linked list position

	public:
		Farray();						//default constructor
		Farray(const Farray &far);		//will use pos
		//~Farray();					//finalizer

		bool resize(int size);			//dynamic array resize 
		bool reshape(int size);			//Fortran reshape
		// other methods
};

extern "C" {	//might put in private section of Farray
	// Fortran side of Farray methods
}

template <typename datp> class Farray1D : public Farray{
	private:
		int size;

	public:
		explicit Farray1D<datp>(int size);		//constructor with size

		bool set(int rank, datp member);	//change element at rank
		datp get(int rank);				//return element at rank
		bool erase(int rank);			//remove element at rank and fill gap
};

extern "C" {
	void cdf1(int* size, int* pos);		//1D double farray creation
	void cif1(int* size, int* pos);		//1D int farray creation
	void cbf1(int* size, int* pos);		//1D bool farray creation
	void ccf1(int* size, int* pos);		//1D char farray creation
}
