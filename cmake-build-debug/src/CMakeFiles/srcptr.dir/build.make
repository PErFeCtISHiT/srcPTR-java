# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/somnus/下载/CLion-2019.1.4/clion-2019.1.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/somnus/下载/CLion-2019.1.4/clion-2019.1.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/somnus/CLionProjects/srcPtr

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/somnus/CLionProjects/srcPtr/cmake-build-debug

# Include any dependencies generated for this target.
include src/CMakeFiles/srcptr.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/srcptr.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/srcptr.dir/flags.make

src/CMakeFiles/srcptr.dir/srcptr.cpp.o: src/CMakeFiles/srcptr.dir/flags.make
src/CMakeFiles/srcptr.dir/srcptr.cpp.o: ../src/srcptr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/srcptr.dir/srcptr.cpp.o"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srcptr.dir/srcptr.cpp.o -c /home/somnus/CLionProjects/srcPtr/src/srcptr.cpp

src/CMakeFiles/srcptr.dir/srcptr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srcptr.dir/srcptr.cpp.i"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/somnus/CLionProjects/srcPtr/src/srcptr.cpp > CMakeFiles/srcptr.dir/srcptr.cpp.i

src/CMakeFiles/srcptr.dir/srcptr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srcptr.dir/srcptr.cpp.s"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/somnus/CLionProjects/srcPtr/src/srcptr.cpp -o CMakeFiles/srcptr.dir/srcptr.cpp.s

# Object files for target srcptr
srcptr_OBJECTS = \
"CMakeFiles/srcptr.dir/srcptr.cpp.o"

# External object files for target srcptr
srcptr_EXTERNAL_OBJECTS =

bin/srcptr: src/CMakeFiles/srcptr.dir/srcptr.cpp.o
bin/srcptr: src/CMakeFiles/srcptr.dir/build.make
bin/srcptr: bin/libsrcsaxeventdispatch.a
bin/srcptr: bin/libsrcsax.a
bin/srcptr: /usr/lib/x86_64-linux-gnu/libxml2.so
bin/srcptr: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
bin/srcptr: src/CMakeFiles/srcptr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/srcptr"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/srcptr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/srcptr.dir/build: bin/srcptr

.PHONY : src/CMakeFiles/srcptr.dir/build

src/CMakeFiles/srcptr.dir/clean:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src && $(CMAKE_COMMAND) -P CMakeFiles/srcptr.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/srcptr.dir/clean

src/CMakeFiles/srcptr.dir/depend:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/somnus/CLionProjects/srcPtr /home/somnus/CLionProjects/srcPtr/src /home/somnus/CLionProjects/srcPtr/cmake-build-debug /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src /home/somnus/CLionProjects/srcPtr/cmake-build-debug/src/CMakeFiles/srcptr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/srcptr.dir/depend
