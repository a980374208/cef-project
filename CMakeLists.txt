# Copyright (c) 2016 The Chromium Embedded Framework Authors. All rights
# reserved. Use of this source code is governed by a BSD-style license that
# can be found in the LICENSE file.

# See the included README.md file for usage instructions.

# For VS2022 and Xcode 12+ support.
cmake_minimum_required(VERSION 3.21)

# Only generate Debug and Release configuration types.
set(CMAKE_CONFIGURATION_TYPES Debug Release)

# Project name.
project(cef)

# Use folders in the resulting project files.
set_property(GLOBAL PROPERTY USE_FOLDERS ON)


#
# CEF configuration.
#

# Add this project's cmake/ directory to the module path.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Download and extract the CEF binary distribution (executes DownloadCEF.cmake).
include(DownloadDeps)
function(_check_dependencies_windows)
  set(dependencies_dir "${CMAKE_CURRENT_SOURCE_DIR}/.deps")
  set(cef_filename "cef_binary_VERSION_PLATFORM.tar.bz2")
  set(cef_destination "cef_binary_VERSION_PLATFORM")

  if(CMAKE_VS_PLATFORM_NAME STREQUAL Win32)
     message(FATAL_ERROR "error in win32")
  else()
	set(arch "x64")
	set(dependencies_list cef)
    string(TOLOWER "${CMAKE_VS_PLATFORM_NAME}" arch)
  endif()
  set(platform windows-${arch})

  _check_dependencies()
endfunction()

_check_dependencies_windows()

# set(CEF_ROOT "${CEF_DOWNLOAD_DIR}/${CEF_DISTRIBUTION}" CACHE INTERNAL "CEF_ROOT")
message("<<<<<<CEF_ROOT = ${CEF_ROOT} - ${CEF_DOWNLOAD_DIR} - ${CEF_DISTRIBUTION}")
# Add the CEF binary distribution's cmake/ directory to the module path.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CEF_ROOT}/cmake")

# Load the CEF configuration (executes FindCEF.cmake).
find_package(CEF REQUIRED)

# Support specification of the Python executable path via the command-line.
if(DEFINED ENV{PYTHON_EXECUTABLE})
  file(TO_CMAKE_PATH "$ENV{PYTHON_EXECUTABLE}" PYTHON_EXECUTABLE)
endif()

if(NOT PYTHON_EXECUTABLE)
  unset(PYTHON_EXECUTABLE)

  # Find the python interpreter.
  find_package(PythonInterp)

  if(NOT ${PYTHONINTERP_FOUND})
    message(FATAL_ERROR "A Python installation is required. Set the "
                        "PYTHON_EXECUTABLE environment variable to explicitly "
                        "specify the Python executable path.")
  endif()
endif()

message(STATUS "Using Python: ${PYTHON_EXECUTABLE}")


#
# Clang-format configuration.
#

# Include the libcef_dll_wrapper target (executes libcef_dll/CMakeLists.txt).
add_subdirectory(${CEF_LIBCEF_DLL_WRAPPER_PATH} libcef_dll_wrapper)
add_subdirectory(${CEF_ROOT}/tests/cefsimple)
# Allow includes relative to the current source directory.
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Configure building of the examples.
option(WITH_EXAMPLES "Enable or disable building of examples." ON)
if(WITH_EXAMPLES)
  # Include example application targets.
  add_subdirectory(examples)
endif()

# TODO: Include other application targets here.

# Display configuration settings.
PRINT_CEF_CONFIG()

if(NOT WITH_EXAMPLES)
  message(STATUS "")
  message(STATUS "NOTE: Targets from the examples folder are not included.")
  message(STATUS "Add -DWITH_EXAMPLES=On to the CMake command-line to include them.")
  message(STATUS "")
endif()
