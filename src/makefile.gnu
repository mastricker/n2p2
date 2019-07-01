#!/bin/make -f

###############################################################################
# EXTERNAL LIBRARY PATHS
###############################################################################
# Enter here paths to GSL or EIGEN if they are not in your standard include
# path. DO NOT completely remove the entry, leave at least "./".
PROJECT_GSL=${GSL_ROOT}/include   #./ #usr/lib/x86_64-linux-gnu
PROJECT_GSL_LIB=${GSL_ROOT}/lib
PROJECT_EIGEN=${EIGEN_ROOT}/include/eigen3 #./ #usr/include/eigen3
PROJECT_BLAS=${OPENBLAS_ROOT}/include
PROJECT_BLAS_LIB=${OPENBLAS_ROOT}/lib

###############################################################################
# COMPILERS AND FLAGS
###############################################################################
PROJECT_CC=g++
PROJECT_MPICC=mpic++
PROJECT_CFLAGS=-O3 -march=native -std=c++98 -fopenmp
PROJECT_CFLAGS_MPI=-Wno-long-long
PROJECT_DEBUG=-g -pedantic-errors -Wall -Wextra
PROJECT_AR=ar
PROJECT_ARFLAGS=-rcsv
PROJECT_CFLAGS_BLAS=
PROJECT_LDFLAGS_BLAS= -I${PROJECT_BLAS} -L${PROJECT_BLAS_LIB} -lopenblas

###############################################################################
# COMPILE-TIME OPTIONS
###############################################################################

# Do not use symmetry function groups.
#PROJECT_OPTIONS+= -DNOSFGROUPS

# Do not use cutoff function cache.
#PROJECT_OPTIONS+= -DNOCFCACHE

# Build with dummy Stopwatch class.
#PROJECT_OPTIONS+= -DNOTIME

# Disable check for low number of neighbors.
#PROJECT_OPTIONS+= -DNONEIGHCHECK

# Compile without MPI support.
#PROJECT_OPTIONS+= -DNOMPI

# Use BLAS together with Eigen.
PROJECT_OPTIONS+= -DEIGEN_USE_BLAS

# Disable all C++ asserts (also Eigen debugging).
#PROJECT_OPTIONS+= -DNDEBUG

# Use Intel MKL together with Eigen.
#PROJECT_OPTIONS+= -DEIGEN_USE_MKL_ALL

# Disable Eigen multi threading.
OPTIONS+= -DEIGEN_DONT_PARALLELIZE
