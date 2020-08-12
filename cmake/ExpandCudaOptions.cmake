if(HYPRE_WITH_CUDA)
   enable_language(CUDA)
   find_package(CUDA REQUIRED) # deprecated but allows us to stop if not found

   cuda_select_nvcc_arch_flags(ARCH_FLAGS)

   # To do extract 70 from code=sm_70 from ARCH

   message(STATUS "ARCH: ${ARCH_FLAGS}")

   list(APPEND EXPAND_OPTIONS "--with-cuda")

   if(HYPRE_USING_UNIFIED_MEMORY)
      list(APPEND EXPAND_OPTIONS "--enable-unified-memory")
   endif()

   # set other cuda libs for interface export here
   if(NOT HYPRE_SHARED)
      list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libculibos.a)
   endif ()

   if(HYPRE_USING_CUSPARSE)
      list(APPEND EXPAND_OPTIONS "--enable-cusparse")
      if(HYPRE_SHARED)
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_cusparse_LIBRARY})
      else()
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libcusparse_static.a)
      endif ()
   endif ()

   if(HYPRE_USING_CURAND)
      list(APPEND EXPAND_OPTIONS "--enable-curand")
      if(HYPRE_SHARED)
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_curand_LIBRARY})
      else()
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libcurand_static.a)
      endif ()
   endif ()

   if(HYPRE_USING_CUBLAS)
      list(APPEND EXPAND_OPTIONS "--enable-cublas")
      if(HYPRE_SHARED)
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_CUBLAS_LIBRARIES})
      else()
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libcublas_static.a)
         list(APPEND EXPORT_INTERFACE_LIBS ${CUDA_TOOLKIT_ROOT_DIR}/lib64/libcublasLt_static.a)
      endif ()   
   endif ()

   if(HYPRE_USING_CUB_ALLOC)
      list(APPEND EXPAND_OPTIONS "--enable-cub")
   endif()

   if(HYPRE_USING_GPU_AWARE_MPI)
      list(APPEND EXPAND_OPTIONS "--enable-gpu-aware-mpi")
   endif()   

   # for now add hard coded SM
   list(APPEND EXPAND_OPTIONS "HYPRE_CUDA_SM=70")
endif()
