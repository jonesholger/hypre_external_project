
# Copyright 1998-2019 Lawrence Livermore National Security, LLC and other
# HYPRE Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

cmake_minimum_required (VERSION 3.13...3.16)

if(${CMAKE_VERSION} VERSION_LESS 3.16)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
else()
  cmake_policy(VERSION 3.16)
endif()

cmake_policy(SET CMP0022 NEW)
#cmake_policy(SET CMP0025 NEW)
#cmake_policy(SET CMP0048 NEW)
#cmake_policy(SET CMP0057 NEW)

include(ExternalProject)


# The version number.
set (HYPRE_VERSION 2.19.0)
set (HYPRE_DATE    2020/05/26)
set (HYPRE_TIME    00:00:00)
set (HYPRE_BUGS    hypre-support@llnl.gov)

project (hypre_external_project
  VERSION ${HYPRE_VERSION}
  LANGUAGES C CXX)

set (HYPRE_ROOT  "${PROJECT_SOURCE_DIR}/build/Source/hypre_external/src")

#Todo use mpicc only when using mpi
set(CC_s "CC=mpicc")
set(CXX_s "CXX=mpiCC")
set(conf "${HYPRE_ROOT}/configure")
set(prefix "--prefix=${HYPRE_ROOT}")
set(libdir "--libdir=${PROJECT_SOURCE_DIR}/install/lib")
set(includedir "--includedir=${PROJECT_SOURCE_DIR}/install/include")

list(APPEND EXPAND_OPTIONS "")
list(APPEND EXPORT_INTERFACE_LIBS "${PROJECT_SOURCE_DIR}/install/lib/libhypre.a")
list(APPEND EXPORT_INCLUDES "${PROJECT_SOURCE_DIR}/install/include")

include(cmake/SetupOptions.cmake)
include(cmake/ExpandBaseOptions.cmake)
include(cmake/ExpandCudaOptions.cmake)
include(cmake/ExpandPackageOptions.cmake)

set(command ${conf} ${prefix} ${libdir} ${includedir} ${EXPAND_OPTIONS} ${CC_s} ${CXX_s})

message(STATUS "command = ${command}")
set_directory_properties(PROPERTIES EP_BASE ${PROJECT_SOURCE_DIR}/build)

ExternalProject_Add(hypre_external
   GIT_REPOSITORY "git@github.com:hypre-space/hypre.git"
   GIT_TAG "60212ab6f3fba66dbe5481904d2f17fe62dab242"
   UPDATE_COMMAND ""
   PATCH_COMMAND ""
   BINARY_DIR ${HYPRE_ROOT} 
   CONFIGURE_COMMAND ${command}
   BUILD_COMMAND make -j 
   )

list(REMOVE_DUPLICATES EXPORT_INTERFACE_LIBS)
list(REMOVE_DUPLICATES EXPORT_INCLUDES)
add_library(hypre INTERFACE IMPORTED GLOBAL)
target_link_libraries(hypre INTERFACE "${EXPORT_INTERFACE_LIBS}")
target_include_directories(hypre INTERFACE "${EXPORT_INCLUDES}")


export (TARGETS hypre
   FILE "${PROJECT_SOURCE_DIR}/install/cmake/HYPRETargets.cmake"
   NAMESPACE HYPRE::
   EXPORT_LINK_INTERFACE_LIBRARIES
  )


