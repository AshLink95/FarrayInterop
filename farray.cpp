#include "farray.hpp"
#include <typeinfo>

// definitions will be here
Farray::Farray(){}
Farray::Farray(const Farray &far){}

template <typename datp> Farray1D<datp>::Farray1D(int size){
	int pos;
	const std::type_info &dp = typeid(datp);

	if (dp == typeid(double)) {
		cdf1(&size, &pos); 
	} else if (dp == typeid(int)) {
		cif1(&size, &pos); 
	} else if (dp == typeid(bool)) {
		cbf1(&size, &pos); 
	} else if (dp == typeid(char)) {
		ccf1(&size, &pos); 
	} else {
		//TODO: display some error msg
	}

	this->size = size;
	this->pos = pos;
}

// 1D copy constructor overload

// Instantiation
template class Farray1D<double>;
template class Farray1D<int>;
template class Farray1D<bool>;
template class Farray1D<char>;
