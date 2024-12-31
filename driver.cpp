#include "farray.hpp"
#include <iostream>

int main(){
	std::cout << "on commence" << std::endl;
	// creation
	int i{4};
	Farray1D<double> fur(i);
	//Farray1D<int> fir(i);
	//Farray1D<bool> fer(i);
	//Farray1D<char> far(i);
	//fur.set(1,1);
	//fur.set(2,3);
	//fur.set(3,2);
	//fur.set(4,-3.14);
	//std::cout << fur.get(0) << std::endl;
	std::cout << "done and dusted" << std::endl;
}
