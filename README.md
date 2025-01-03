Farray is a C++ library that allows a way to use Fortran arrays in C++.

# Why?
Fortran is blazing fast in all things scientific computation, especially when it comes to array operations, faster than C++, C, Zig and even Julia. On top of this, a lot of scientific computing libraries are built and optimized in Fortran.

As for C++, it's C++.

# How is it implemented?
The library includes a few dynamic C++ classes, each of which follow the convention `FarraynD`. Each of these classes allow 4 types which are `double`, `int`, `bool` and `char`.

The main feature of any farray class is that it's possible to transition between it and C++ dynamic arrays very easily while keeping the same size and elements. This allows the use of all array libraries in both C++ and Fortran.

The whole library is implemented in a way that's easy to modify the source code to include more useful methods using both Fortran and C++.

# Installation
After cloning the repo, check the makefile if you want to modify the compilers, flags and directories. After that, in the repo's directory, in your terminal, simply type:
```Shell
make
```

# How to use?
Technically, this is a header-only library which makes it super easy to use without migrating a bunch of files around.

In your C++ file, have this header
```C++
#include "farray.hpp"
```

When compiling a file that makes use of this library, it's preferable to use g++ and include the flag in the following example:
```Shell
g++ -o exp exp.cpp -L path\to\library_dir -I path\to\header_dir -lfarray -lgfortran
```
Rq: The flag you need to use is included in the makefile.
