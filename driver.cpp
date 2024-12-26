#include "farray.hpp"
#include <iostream>

int main(){
	std::cout << "on commence" << std::endl;
	// creation
	int i{4};
	Farray1D<double> fur(i);
	Farray1D<int> fir(i);
	Farray1D<bool> fer(i);
	Farray1D<char> far(i);
	std::cout << "done and dusted" << std::endl;
}
