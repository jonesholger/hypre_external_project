
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

include(ExternalProject)


# The version number.
set (HYPRE_VERSION 2.19.0)
set (HYPRE_DATE    2020/05/26)
set (HYPRE_TIME    00:00:00)
set (HYPRE_BUGS    hypre-support@llnl.gov)

project (hypre_external_project
  VERSION ${HYPRE_VERSION}
  LANGUAGES NONE)

set (HYPRE_ROOT  "${PROJECT_SOURCE_DIR}/build/Source/hypre/src")

set(CC_s "CC=mpicc")
set(CXX_s "CXX=mpiCC")
set(conf "${HYPRE_ROOT}/configure")
set(prefix "--prefix=${HYPRE_ROOT}")
set(libdir "--libdir=${PROJECT_SOURCE_DIR}/install/lib")
set(includedir "--includedir=${PROJECT_SOURCE_DIR}/install/include")

set(command ${conf} ${prefix} ${libdir} ${includedir} ${CC_s} ${CXX_s})

message(STATUS "command = ${command}")
set_directory_properties(PROPERTIES EP_BASE ${PROJECT_SOURCE_DIR}/build)

ExternalProject_Add(hypre
   GIT_REPOSITORY "git@github.com:hypre-space/hypre.git"
   GIT_TAG "60212ab6f3fba66dbe5481904d2f17fe62dab242"
   UPDATE_COMMAND ""
   PATCH_COMMAND ""
   BINARY_DIR ${HYPRE_ROOT} 
   CONFIGURE_COMMAND ${command}
   BUILD_COMMAND make -j 
   )




