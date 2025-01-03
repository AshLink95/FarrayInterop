#include <typeinfo>
#include <iostream>

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

template <typename datp> void Farray1D<datp>::set(int rank, datp member){
	const std::type_info &dp = typeid(datp);
	int pos = this->pos;

	//TODO: error handling rank (pass by val and non int) and out of bound
	if (dp == typeid(double)) {
		sdf1(&rank, &member, &pos); 
	} else if (dp == typeid(int)) {
		//sif1(&rank, &member, &pos); 
	} else if (dp == typeid(bool)) {
		//sbf1(&rank, &member, &pos); 
	} else if (dp == typeid(char)) {
		//scf1(&rank, &member, &pos); 
	} else {
		//TODO: display some error msg
	}
}

template <typename datp> datp Farray1D<datp>::get(int rank){
	datp res;
	int pos = this->pos;
	const std::type_info &dp = typeid(datp);

	//TODO: error handling rank (pass by val and non int) and out of bound
	if (dp == typeid(double)) {
		res = gdf1(&rank, &pos); 
	} else if (dp == typeid(int)) {
		//res = gif1(&rank, &pos); 
	} else if (dp == typeid(bool)) {
		//res = gbf1(&rank, &pos); 
	} else if (dp == typeid(char)) {
		//res = gcf1(&rank, &pos); 
	} else {
		//TODO: display some error msg
	}
	return res;
}
