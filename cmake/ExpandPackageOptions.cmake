if (NOT HYPRE_USING_HYPRE_BLAS)
  # Find system blas
  find_package(BLAS REQUIRED)
  list(APPEND EXPORT_INTERFACE_LIBS ${BLAS_LIBRARIES})
  list(APPEND EXPAND_OPTIONS "--with-blas")
endif()

# Headers and sources: lapack
if (NOT HYPRE_USING_HYPRE_LAPACK)
  # Find system lapack
  find_package(LAPACK REQUIRED)
  list(APPEND EXPORT_INTERFACE_LIBS ${LAPACK_LIBRARIES})
  list(APPEND EXPAND_OPTIONS "--with-lapack")
endif()

