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
include test/CMakeFiles/TestClassPolicy.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/TestClassPolicy.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/TestClassPolicy.dir/flags.make

test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o: test/CMakeFiles/TestClassPolicy.dir/flags.make
test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o: ../test/TestClassPolicy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o -c /home/somnus/CLionProjects/srcPtr/test/TestClassPolicy.cpp

test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.i"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/somnus/CLionProjects/srcPtr/test/TestClassPolicy.cpp > CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.i

test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.s"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/somnus/CLionProjects/srcPtr/test/TestClassPolicy.cpp -o CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.s

# Object files for target TestClassPolicy
TestClassPolicy_OBJECTS = \
"CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o"

# External object files for target TestClassPolicy
TestClassPolicy_EXTERNAL_OBJECTS =

bin/TestClassPolicy: test/CMakeFiles/TestClassPolicy.dir/TestClassPolicy.cpp.o
bin/TestClassPolicy: test/CMakeFiles/TestClassPolicy.dir/build.make
bin/TestClassPolicy: bin/libsrcsaxeventdispatch.a
bin/TestClassPolicy: bin/libsrcsax.a
bin/TestClassPolicy: /usr/lib/x86_64-linux-gnu/libxml2.so
bin/TestClassPolicy: test/CMakeFiles/TestClassPolicy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/TestClassPolicy"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestClassPolicy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/TestClassPolicy.dir/build: bin/TestClassPolicy

.PHONY : test/CMakeFiles/TestClassPolicy.dir/build

test/CMakeFiles/TestClassPolicy.dir/clean:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -P CMakeFiles/TestClassPolicy.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/TestClassPolicy.dir/clean

test/CMakeFiles/TestClassPolicy.dir/depend:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/somnus/CLionProjects/srcPtr /home/somnus/CLionProjects/srcPtr/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test/CMakeFiles/TestClassPolicy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/TestClassPolicy.dir/depend

