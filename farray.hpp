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

//either implement templates or children of children for datps
class Farray1Dd : public Farray{
	private:
		int size;

	public:
		Farray1Dd(int size);			//constructor with size

		bool set(int rank, double member);	//change element at rank
		double get(int rank);			//return element at rank
		bool erase(int rank);			//remove element at rank and fill gap
};

extern "C" {	//might put in private section of Farray1D
	// Fortran side of Farray1D methods
	void cdf1(int* size, int* pos);		//1D double farray creation
}
