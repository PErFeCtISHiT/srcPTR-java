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
include test/CMakeFiles/TestCallPolicy.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/TestCallPolicy.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/TestCallPolicy.dir/flags.make

test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o: test/CMakeFiles/TestCallPolicy.dir/flags.make
test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o: ../test/TestCallPolicy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o -c /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp

test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.i"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp > CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.i

test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.s"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/somnus/CLionProjects/srcPtr/test/TestCallPolicy.cpp -o CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.s

# Object files for target TestCallPolicy
TestCallPolicy_OBJECTS = \
"CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o"

# External object files for target TestCallPolicy
TestCallPolicy_EXTERNAL_OBJECTS =

bin/TestCallPolicy: test/CMakeFiles/TestCallPolicy.dir/TestCallPolicy.cpp.o
bin/TestCallPolicy: test/CMakeFiles/TestCallPolicy.dir/build.make
bin/TestCallPolicy: bin/libsrcsaxeventdispatch.a
bin/TestCallPolicy: bin/libsrcsax.a
bin/TestCallPolicy: /usr/lib/x86_64-linux-gnu/libxml2.so
bin/TestCallPolicy: test/CMakeFiles/TestCallPolicy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/TestCallPolicy"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestCallPolicy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/TestCallPolicy.dir/build: bin/TestCallPolicy

.PHONY : test/CMakeFiles/TestCallPolicy.dir/build

test/CMakeFiles/TestCallPolicy.dir/clean:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -P CMakeFiles/TestCallPolicy.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/TestCallPolicy.dir/clean

test/CMakeFiles/TestCallPolicy.dir/depend:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/somnus/CLionProjects/srcPtr /home/somnus/CLionProjects/srcPtr/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test/CMakeFiles/TestCallPolicy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/TestCallPolicy.dir/depend
