#include <typeinfo>
#include <stdexcept>

Farray::Farray(){}

template <typename datp> Farray1D<datp>::Farray1D(int size){
	const std::type_info &dp = typeid(datp);
	int pos;
	int tize = size;

	if (size <= 0) {
		throw std::invalid_argument("Invalid farray size");
	}

	if (dp == typeid(double)) {
		cdf1(&tize, &pos); 
	} else if (dp == typeid(int)) {
		cif1(&tize, &pos); 
	} else if (dp == typeid(bool)) {
		cbf1(&tize, &pos); 
	} else if (dp == typeid(char)) {
		ccf1(&tize, &pos); 
	} else {
		throw std::invalid_argument("Only double, int, bool and char farrays are allowed");
	}

	this->size = size;
	this->pos = pos;
}

template <typename datp> Farray1D<datp>::Farray1D(Farray1D &far){
	const std::type_info &dp = typeid(datp);
	int pos;
	int i;
	int size = far.length();

	if (dp == typeid(double)) {
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
		throw std::invalid_argument("Only double, int, bool and char farrays are allowed");
	}

	this->size = size;
	this->pos = pos;
}

template <typename datp> Farray1D<datp>::Farray1D(datp array[], int size){
	const std::type_info &dp = typeid(datp);
	int pos;
	int i,j;

	if (dp == typeid(double)) {
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
		throw std::invalid_argument("Only double, int, bool and char farrays are allowed");
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

	if (dp == typeid(double)) {
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
	} else {
		throw std::invalid_argument("Only double, int, bool and char farrays are allowed");
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

	if (dp == typeid(double)) {
		res = gdf1(&tank, &pos);
	} else if (dp == typeid(int)) {
		res = gif1(&tank, &pos);
	} else if (dp == typeid(bool)) {
		res = gbf1(&tank, &pos);
	} else if (dp == typeid(char)) {
		res = gcf1(&tank, &pos);
	} else {
		throw std::invalid_argument("Only double, int, bool and char farrays are allowed");
	}
	return res;
}

template <typename datp> int Farray1D<datp>::length(){
	return this->size;
}

