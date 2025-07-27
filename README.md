Farray is a C++ library that provides a way to use Fortran arrays in C++, allowing for seamless Interoperability between these languages. Hence the name FarrayInterop.

# Why?
Fortran is blazing fast in all things scientific computation, especially when it comes to array operations, faster than C++, C, Zig and even Julia. On top of this, a lot of scientific computing libraries are built and optimized in Fortran.

As for C++, it's C++.

# How is it implemented?
This library is really just Fortran allocatable arrays in the form of C++ dynamic classes, each of which follow the convention `FarraynD` with `n` being indicative of the dimensionality of the farray. Each of these classes allow 5 types which are `float`, `double`, `int`, `bool` and `char`.

The Fortran allocatable arrays are each part of a node in a doubly linked list of arrays, implemented in a minimalistic and efficient way:
- Minimalistic because there isn't a defined linked list structure. Instead, the nodes are managed by a single global pointer for each data type in the dlla module.
- Efficient because the fetching part of any operation involving the last defined farray has a time complexity of $O(1)$.

The main feature of any farray class is that it's possible to transition between it and C++ dynamically allocated arrays (pointers) very easily while keeping the same size and elements. This allows the use of all array libraries in both C++ and Fortran.

The whole library is implemented in a way that's easy to modify the source code to include more useful methods using both Fortran and C++.

Lastly, This library follows the C++20 standard. This makes it so that users don't have to worry about warnings when using C++20.

# Installation
After cloning the repo, check the `CMakeLists.txt` if you want to modify some details. Under normal circumstances, you wouldn't. After that, in the repo's directory, in your terminal, try:
```Shell
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja -S . -B build
cmake --build build -j
```
These flags are simply optimal. Just make sure to install ninja. Just make sure you have [ninja](https://github.com/ninja-build/ninja).  
Once done, you'll find a nice static library called `libfarray.a`, ready to roll in the `libdir` directory.

To test your new library, 
```Shell
cd build
ctest
```

And, lastly, to cleanup intermediate files and test binaries, which is the whole `build` directory,
```Shell
cmake --build build --target purge
```

## Arch Linux
FarrayInterop is available to download from the AUR through
```bash
yay farrayinterop-git
```

# How to use?
Technically, this is a precompiled static library which makes it super easy to use without migrating a bunch of files around.

In your C++ file, have this header
```C++
#include "farray.hpp"
```
Or the relative pathname of the header file to mitigate the need for the `-I` flag when compiling, as you will see later, and allow your LSP to recognize the header.

When compiling a file that makes use of this library, it's preferable to use g++ and include all the flags in the following example:
```Shell
g++ -std=c++20 exp.cpp -I path/to/header_dir -L path/to/library_dir -lfarray -lgfortran
```

Note that adding the header file and its template in your system's C++ header path, which should be `CPLUS_INCLUDE_PATH` by default, mitigates the need for the `-I` flag and makes the header
```C++
#include <farray.hpp>
```

Similarly, adding the library file in your system's library path, which should be `LD_LIBRARY_PATH` by default, mitigates the need for the `-L` flag.

If you do these 2 things, you will only need the flags `-lfarray` to make use of this library and subsequently `-lgfortran` for Fortran C++ interoperability.

# Extensibility
The main feature of this library is its ease of extensibility which can be done in several ways if you put your mind into it but I would recommend the following approach for array operations:

0. Create your own Fortran module of functions and subroutines if they're more complex than a simple array operation and use it in one of the farrayimp Fortran files (according to dimensionality)

1. Define your functions or subroutines in a farrayimp file with `bind(C)` while making use of the doubly linked list of arrays through a node pointer like all methods defined there. Use them as a template.

2. In the header file, declare the methods that make use of these previously mentioned functions in the respective farray class definition and declare the function you wrote in Fortran in an `extern "C"` block.

3. In a template file, define the methods you declared in the header file. Obviously, if you're creating a new template, include it at the end of the header file.
