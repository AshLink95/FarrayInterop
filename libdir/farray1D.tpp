# pragma once

#include <typeinfo>
#include <stdexcept>

template <typename datp> Farray1D<datp>::Farray1D(int size){
	const std::type_info &dp = typeid(datp);
	int pos;
	int tize = size;

	if (size <= 0) {
		throw std::invalid_argument("Invalid farray size");
	}

	if (dp == typeid(float)) {
		cff1(&tize, &pos); 
	} else if (dp == typeid(double)) {
		cdf1(&tize, &pos); 
	} else if (dp == typeid(int)) {
		cif1(&tize, &pos); 
	} else if (dp == typeid(bool)) {
		cbf1(&tize, &pos); 
	} else if (dp == typeid(char)) {
		ccf1(&tize, &pos); 
	} else {
		throw std::invalid_argument("Only float, double, int, bool and char farrays are allowed");
	}

	this->size = size;
	this->pos = pos;
}

template <typename datp> Farray1D<datp>::Farray1D(Farray1D &far){
	const std::type_info &dp = typeid(datp);
	int pos;
	int i;
	int size = far.length();

	if (dp == typeid(float)) {
		cff1(&size, &pos);
		for (i=1;i<=size;i++){
			float member = static_cast<float>(far.get(i));
			sff1(&i, &member, &pos);
		}
	} else if (dp == typeid(double)) {
		cdf1(&size, &pos);
		for (i=1;i<=size;i++){
			double member = static_cast<double>(far.get(i));
			sdf1(&i, &member, &pos);
		}
	} else if (dp == typeid(int)) {
		cif1(&size, &pos);
		for (i=1;i<=size;i++){
			int member = static_cast<int>(far.get(i));
			sif1(&i, &member, &pos);
		}
	} else if (dp == typeid(bool)) {
		cbf1(&size, &pos);
		for (i=1;i<=size;i++){
			bool member = static_cast<bool>(far.get(i));
			sbf1(&i, &member, &pos);
		}
	} else if (dp == typeid(char)) {
		ccf1(&size, &pos);
		for (i=1;i<=size;i++){
			char member = static_cast<char>(far.get(i));
			scf1(&i, &member, &pos);
		}
	} else {
		throw std::invalid_argument("Only float, double, int, bool and char farrays are allowed");
	}

	this->size = size;
	this->pos = pos;
}

template <typename datp> Farray1D<datp>::Farray1D(datp array[], int size){
	const std::type_info &dp = typeid(datp);
	int pos;
	int i, j;

	if (size <= 0){
		throw std::out_of_range("Invalid slice size");
	}

	if (dp == typeid(float)) {
		cff1(&size, &pos);
		for (i=0;i<size;i++){
			j = i + 1;
			float member = static_cast<float>(array[i]);
			sff1(&j, &member, &pos);
		}
	} else if (dp == typeid(double)) {
		cdf1(&size, &pos);
		for (i=0;i<size;i++){
			j = i + 1;
			double member = static_cast<double>(array[i]);
			sdf1(&j, &member, &pos);
		}
	} else if (dp == typeid(int)) {
		cif1(&size, &pos);
		for (i=0;i<size;i++){
			j = i + 1;
			int member = static_cast<int>(array[i]);
			sif1(&j, &member, &pos);
		}
	} else if (dp == typeid(bool)) {
		cbf1(&size, &pos);
		for (i=0;i<size;i++){
			j = i + 1;
			bool member = static_cast<bool>(array[i]);
			sbf1(&j, &member, &pos);
		}
	} else if (dp == typeid(char)) {
		ccf1(&size, &pos);
		for (i=0;i<size;i++){
			j = i + 1;
			char member = static_cast<char>(array[i]);
			scf1(&j, &member, &pos);
		}
	} else {
		throw std::invalid_argument("Only float, double, int, bool and char farrays are allowed");
	}

	this->size = size;
	this->pos = pos;
}

template <typename datp> void Farray1D<datp>::set(int rank, datp member){
	const std::type_info &dp = typeid(datp);
	int pos = this->pos;
	int tank = rank;

	if (rank > this->size){
		throw std::out_of_range("Index out of range");
	} else if (rank <= 0){
		throw std::out_of_range("Index out of range. Farrays start at 1");
	}

	if (dp == typeid(float)) {
		float tember = static_cast<float>(member);
		sff1(&tank, &tember, &pos);
	} else if (dp == typeid(double)) {
		double tember = static_cast<double>(member);
		sdf1(&tank, &tember, &pos);
	} else if (dp == typeid(int)) {
		int tember = static_cast<int>(member);
		sif1(&tank, &tember, &pos); 
	} else if (dp == typeid(bool)) {
		bool tember = static_cast<bool>(member);
		sbf1(&tank, &tember, &pos); 
	} else if (dp == typeid(char)) {
		char tember = static_cast<char>(member);
		scf1(&tank, &tember, &pos); 
	}
}

template <typename datp> datp Farray1D<datp>::get(int rank){
	const std::type_info &dp = typeid(datp);
	datp res;
	int pos = this->pos;
	int tank = rank;

	if (rank > this->size){
		throw std::out_of_range("Index out of range");
	} else if (rank <= 0){
		throw std::out_of_range("Index out of range. Farrays start at 1");
	}

	if (dp == typeid(float)) {
		res = gff1(&tank, &pos);
	} else if (dp == typeid(double)) {
		res = gdf1(&tank, &pos);
	} else if (dp == typeid(int)) {
		res = gif1(&tank, &pos);
	} else if (dp == typeid(bool)) {
		res = gbf1(&tank, &pos);
	} else if (dp == typeid(char)) {
		res = gcf1(&tank, &pos);
	}
	return res;
}

template <typename datp> int Farray1D<datp>::length(){
	return this->size;
}

template <typename datp> Farray1D<datp> Farray1D<datp>::slice(int start, int end){
	int size = end - start + 1;
	int i,j;
	datp* arrptr;

	if (size <= 0 || size > this->size || start <= 0 || end <= 0){
		throw std::out_of_range("Invalid slice size");
	}
	Farray1D<datp> farr(size);

	arrptr = this->tocpp();
	for(i=start;i<=end;i++){
		j = i - start + 1;
		farr.set(j,arrptr[i-1]);
	}
	return farr;
}

template <typename datp> datp* Farray1D<datp>::tocpp(){
	const std::type_info &dp = typeid(datp);
	datp* arrptr = new datp[this->size];
	int i, j;
	int pos = this->pos;

	if (dp == typeid(float)) {
		for (i=1;i<=size;i++){
			j = i - 1;
			float member = static_cast<float>(this->get(i));
			arrptr[j] = member;
		}
	} else if (dp == typeid(double)) {
		for (i=1;i<=size;i++){
			j = i - 1;
			double member = static_cast<double>(this->get(i));
			arrptr[j] = member;
		}
	} else if (dp == typeid(int)) {
		for (i=1;i<=size;i++){
			j = i - 1;
			int member = static_cast<int>(this->get(i));
			arrptr[j] = member;
		}
	} else if (dp == typeid(bool)) {
		for (i=1;i<=size;i++){
			j = i - 1;
			bool member = static_cast<bool>(this->get(i));
			arrptr[j] = member;
		}
	} else if (dp == typeid(char)) {
		for (i=1;i<=size;i++){
			j = i - 1;
			char member = static_cast<char>(this->get(i));
			arrptr[j] = member;
		}
	}
	return arrptr;
}

template <typename datp> std::ostream& operator<<(std::ostream& os, Farray1D<datp>& farr){
	const std::type_info &dp = typeid(datp);
	int i,size = farr.length();

	if (dp == typeid(char)){
		for (i=1;i<=size;i++){
			os << farr.get(i);
		}
	} else{
		for (i=1;i<=size;i++){
			os << farr.get(i);
			if (i <= size - 1) {
				os << ", ";
			}
		}
	}

	return os;
}
