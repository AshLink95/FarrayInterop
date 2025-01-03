#include "farray.hpp"
#include <iostream>

int main(){
	std::cout << "on commence" << std::endl;
	// creation
	int i{4};
	Farray1D<double> fur(5);
	std::cout << "1 down" << std::endl;
	Farray1D<int> fir(i);
	std::cout << "2 down" << std::endl;
	Farray1D<bool> fbr(i);
	std::cout << "3 down" << std::endl;
	Farray1D<char> fcr(i);
	std::cout << "4 down" << std::endl;
	int ii{2};
	double d{2.4};
	bool b{true};
	char c{'g'};
	fur.set(ii,d);
	std::cout << fur.get(ii) << std::endl;
	fir.set(ii,i);
	std::cout << fir.get(ii) << std::endl;
	fbr.set(ii,b);
	std::cout << fbr.get(ii) << std::endl;
	fcr.set(ii,c);
	std::cout << fcr.get(ii) << std::endl;
	double ar[3] = {-0.078,1.2,4.5};
	Farray1D<double> tar(ar);
	std::cout << tar.get(0) << std::endl;
	std::cout << "done and dusted" << std::endl;
}
