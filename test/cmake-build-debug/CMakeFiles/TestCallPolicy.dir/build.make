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
CMAKE_SOURCE_DIR = /home/somnus/CLionProjects/srcPtr/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/somnus/CLionProjects/srcPtr/test/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/TestCallPolicy.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/TestCallPolicy.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TestCallPolicy.dir/flags.make

CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o: CMakeFiles/TestCallPolicy.dir/flags.make
CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o: ../TestCallPolicy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/somnus/CLionProjects/srcPtr/test/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o -c /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp

CMakeFiles/TestCallPolicy.dir/TestCallPolicy.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestCallPolicy.dir/TestCallPolicy.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp > CMakeFiles/TestCallPolicy.dir/TestCallPolicy.i

CMakeFiles/TestCallPolicy.dir/TestCallPolicy.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestCallPolicy.dir/TestCallPolicy.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp -o CMakeFiles/TestCallPolicy.dir/TestCallPolicy.s

# Object files for target TestCallPolicy
TestCallPolicy_OBJECTS = \
"CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o"

# External object files for target TestCallPolicy
TestCallPolicy_EXTERNAL_OBJECTS =

bin/TestCallPolicy: CMakeFiles/TestCallPolicy.dir/TestCallPolicy.o
bin/TestCallPolicy: CMakeFiles/TestCallPolicy.dir/build.make
bin/TestCallPolicy: CMakeFiles/TestCallPolicy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/somnus/CLionProjects/srcPtr/test/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/TestCallPolicy"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestCallPolicy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TestCallPolicy.dir/build: bin/TestCallPolicy

.PHONY : CMakeFiles/TestCallPolicy.dir/build

CMakeFiles/TestCallPolicy.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TestCallPolicy.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TestCallPolicy.dir/clean

CMakeFiles/TestCallPolicy.dir/depend:
	cd /home/somnus/CLionProjects/srcPtr/test/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/somnus/CLionProjects/srcPtr/test /home/somnus/CLionProjects/srcPtr/test /home/somnus/CLionProjects/srcPtr/test/cmake-build-debug /home/somnus/CLionProjects/srcPtr/test/cmake-build-debug /home/somnus/CLionProjects/srcPtr/test/cmake-build-debug/CMakeFiles/TestCallPolicy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TestCallPolicy.dir/depend
