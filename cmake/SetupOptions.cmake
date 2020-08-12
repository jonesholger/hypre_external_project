# Configuration options
option(HYPRE_ENABLE_DEBUG            "Set compiler flags for debugging" OFF)
option(HYPRE_ENABLE_SHARED           "Build a shared library" OFF)
option(HYPRE_ENABLE_BIGINT           "Use long long int for HYPRE_Int" OFF)
option(HYPRE_ENABLE_MIXEDINT         "Use long long int for HYPRE_BigInt, int for HYPRE_INT" OFF)
option(HYPRE_ENABLE_SINGLE           "Use float for HYPRE_Real" OFF)
option(HYPRE_ENABLE_LONG_DOUBLE      "Use long double for HYPRE_Real" OFF)
option(HYPRE_ENABLE_COMPLEX          "Use complex values" OFF)
option(HYPRE_ENABLE_HYPRE_BLAS       "Use internal BLAS library" ON)
option(HYPRE_ENABLE_HYPRE_LAPACK     "Use internal LAPACK library" ON)
option(HYPRE_ENABLE_PERSISTENT_COMM  "Use persistent communication" OFF)
option(HYPRE_ENABLE_GLOBAL_PARTITION "Use global partitioning" OFF)
option(HYPRE_ENABLE_FEI              "Use FEI" OFF)
option(HYPRE_WITH_MPI                "Compile with MPI" ON)
option(HYPRE_WITH_OPENMP             "Use OpenMP" OFF)
option(HYPRE_WITH_CUDA               "Use CUDA" OFF)
option(HYPRE_WITH_HOPSCOTCH          "Use hopscotch hashing with OpenMP" OFF)
option(HYPRE_WITH_DSUPERLU           "Use TPL SuperLU_Dist" OFF)
option(HYPRE_WITH_CALIPER            "Use Caliper" OFF) 
option(HYPRE_PRINT_ERRORS            "Print HYPRE errors" OFF)
option(HYPRE_TIMING                  "Use HYPRE timing routines" OFF)
option(HYPRE_BUILD_EXAMPLES          "Build examples" OFF)
option(HYPRE_BUILD_TESTS             "Build tests" OFF)

# CUDA options
option(HYPRE_USING_UNIFIED_MEMORY    "Use Unified Memory with CUDA" ON)
option(HYPRE_USING_CUDA_STREAMS      "Use CUDA streams vs NULL stream" ON)
option(HYPRE_USING_NVTX              "Use NVTX library for profiling" OFF)
option(HYPRE_USING_CUSPARSE          "Use cuSparse library" ON)
option(HYPRE_USING_CUB_ALLOC         "Use CUB Allocator" OFF)
option(HYPRE_USING_CUBLAS            "Use cuBlas library" OFF)
option(HYPRE_USING_CURAND            "Use cuRand library" ON)
option(HYPRE_USING_GPU_AWARE_MPI     "Use gpu aware mpi" OFF)

#Performance Portability
option(HYPRE_USING_RAJA              "Use RAJA portability layer" OFF)
option(HYPRE_USING_KOKKOS            "Use Kokkos portability layer" OFF)





