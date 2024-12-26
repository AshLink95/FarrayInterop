#include "farray.hpp"
#include <iostream>

int main(){
	std::cout << "on commence" << std::endl;
	// creation
	int i{4};
	Farray1D<double> far(i);
	Farray1D<int> fir(i);
	std::cout << "done and dusted" << std::endl;
}
