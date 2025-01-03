#include "farray.hpp"
#include <iostream>

int main(){
	std::cout << "on commence" << std::endl;
	// creation
	int i{4};
	Farray1D<double> fur(i);
	std::cout << "1 down" << std::endl;
	Farray1D<double> fir(i);
	std::cout << "2 down" << std::endl;
	Farray1D<bool> fbr(i);
	std::cout << "3 down" << std::endl;
	Farray1D<char> fcr(i);
	std::cout << "4 down" << std::endl;
	int ii{2};
	double d{2.4};
	fur.set(ii,d);
	std::cout << fur.get(ii) << std::endl;
	fir.set(ii,++d);
	std::cout << fir.get(ii) << std::endl;
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
