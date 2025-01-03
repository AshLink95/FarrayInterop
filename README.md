Farray is a C++ library that allows a way to use Fortran arrays in C++.

# Why?
Fortran is blazing fast when it comes to scientific computations, faster than C++, C, Zig and even Julia, especially when it comes to array operations. On top of this, a lot of scientific computing libraries are built and optimized in Fortran.
And, C++ is C++.

The main feature of the farray class is that it's possible to transition between C++ dynamic arrays and farrays very easily while keeping the same size and elements. This allows the use of all array libraries in both C++ and Fortran.

# How is it implemented?
The library includes a few dynamic C++ classes, each of which follow the convention `FarraynD`. Each of these classes allow 4 types which are `double`, `int`, `bool` and `char`.

It's implemented in a way that's easy to modify the source code to include more useful methods using both Fortran and C++.

# Installation
After cloning the repo, check the makefile if you want to modify the compilers, flags and directories. After that, in the repo's directory, in your terminal, simply
```Shell
make
```

# How to use?
In your C++ file, have this header
```C++
#include "farray.hpp"
```

When compiling, preferably use g++ and include the flag in the following example:
```Shell
g++ -o exp exp.cpp -L path\to\library_dir -I path\to\header_dir -lfarray -lgfortran
```
Rq: The flag you need to use is included in the makefile.
