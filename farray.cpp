#include "farray.hpp"
#include <typeinfo>

// definitions will be here
Farray::Farray(){}
Farray::Farray(const Farray &far){}

template <typename datp> Farray1D<datp>::Farray1D(int size){
	int pos;
	const std::type_info &dp = typeid(datp);

	//TODO: error handling size (pass by val and non int)
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

template <typename datp> bool Farray1D<datp>::set(int rank, datp member){
	bool result;
	const std::type_info &dp = typeid(datp);

	//TODO: error handling rank (pass by val and non int)
	if (dp == typeid(double)) {
		result = sdf1(&rank, &member, &pos); 
	} else if (dp == typeid(int)) {
		//result = sif1(&rank, &member, &pos); 
	} else if (dp == typeid(bool)) {
		//result = sbf1(&rank, &member, &pos); 
	} else if (dp == typeid(char)) {
		//result = scf1(&rank, &member, &pos); 
	} else {
		//TODO: display some error msg
	}
}

template <typename datp> datp Farray1D<datp>::get(int rank){
	datp result;
	const std::type_info &dp = typeid(datp);

	//TODO: error handling rank (pass by val and non int)
	if (dp == typeid(double)) {
		result = gdf1(&rank, &pos); 
	} else if (dp == typeid(int)) {
		//result = gif1(&rank, &pos); 
	} else if (dp == typeid(bool)) {
		//result = gbf1(&rank, &pos); 
	} else if (dp == typeid(char)) {
		//result = gcf1(&rank, &pos); 
	} else {
		//TODO: display some error msg
	}
}

// Instantiation
template class Farray1D<double>;
//template class Farray1D<int>;
//template class Farray1D<bool>;
//template class Farray1D<char>;
