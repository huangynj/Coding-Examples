
# use this compiler for the .f90 --> .o step

FC=gfortran -c

# use these options to the compiler

FFLAGS=-std=f2008 -Wall -fcheck=all

# use the compiler driver for the .o --> a.out step

LD=gfortran

# use these options to the linker

LDFLAGS=

# make this executable

Complex: Complex.o
	${LD} ${LDFLAGS} Complex.o -o Complex

# make this object file

Complex.o: Complex.f90
	${FC} ${FFLAGS} Complex.f90
