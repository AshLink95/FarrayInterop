#include "farray.hpp"

// definitions will be here
Farray::Farray(){}

Farray1Dd::Farray1Dd(int size){
	int pos;
	cdf1(&size, &pos); 
	this->size = size;
	this->pos = pos;
}

