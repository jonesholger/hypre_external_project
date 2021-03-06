if(HYPRE_ENABLE_DEBUG)
   list(APPEND EXPAND_OPTIONS "--enable-debug")
endif()
if(HYPRE_ENABLE_SHARED)
   list(APPEND EXPAND_OPTIONS "--enable-shared")
endif()
if(HYPRE_ENABLE_BIGINT)
   list(APPEND EXPAND_OPTIONS "--enable-bigint")
endif()
if(HYPRE_ENABLE_MIXEDINT)
   list(APPEND EXPAND_OPTIONS "--enable-mixedint")
endif()
if(HYPRE_ENABLE_SINGLE)
   list(APPEND EXPAND_OPTIONS "--enable-single")
endif()
if(HYPRE_ENABLE_LONG_DOUBLE)
   list(APPEND EXPAND_OPTIONS "--enable-longdouble")
endif()
if(HYPRE_ENABLE_COMPLEX)
   list(APPEND EXPAND_OPTIONS "--enable-complex")
endif()
if(HYPRE_ENABLE_PERSISTENT_COMM)
   list(APPEND EXPAND_OPTIONS "--enable-persistent")
endif()
if(HYPRE_ENABLE_GLOBAL_PARTITION)
   list(APPEND EXPAND_OPTIONS "--enable-global-partition")
endif()
if(HYPRE_PRINT_ERRORS)
   list(APPEND EXPAND_OPTIONS "--with-print-errors")
endif()
if(HYPRE_TIMING)
   list(APPEND EXPAND_OPTIONS "--with-timing")
endif()

#Todo provide separate expansion section for all of the MPI options
if(HYPRE_WITH_MPI)
   list(APPEND EXPAND_OPTIONS "--with-MPI")
endif()


#Todo move this to performance portability expansion
if(HYPRE_WITH_OPENMP)
   list(APPEND EXPAND_OPTIONS "--with-openmp")
   if(HYPRE_WITH_HOPSCOTCH)
      list(APPEND EXPAND_OPTIONS "--enable-hopscotch")
   endif()
endif()



