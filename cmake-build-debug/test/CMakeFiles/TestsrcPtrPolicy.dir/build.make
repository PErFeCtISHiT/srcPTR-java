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
include test/CMakeFiles/TestsrcPtrPolicy.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/TestsrcPtrPolicy.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/TestsrcPtrPolicy.dir/flags.make

test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o: test/CMakeFiles/TestsrcPtrPolicy.dir/flags.make
test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o: ../test/TestsrcPtrPolicy.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o -c /home/somnus/CLionProjects/srcPtr/test/TestsrcPtrPolicy.cpp

test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.i"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/somnus/CLionProjects/srcPtr/test/TestsrcPtrPolicy.cpp > CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.i

test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.s"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/somnus/CLionProjects/srcPtr/test/TestsrcPtrPolicy.cpp -o CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.s

# Object files for target TestsrcPtrPolicy
TestsrcPtrPolicy_OBJECTS = \
"CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o"

# External object files for target TestsrcPtrPolicy
TestsrcPtrPolicy_EXTERNAL_OBJECTS =

bin/TestsrcPtrPolicy: test/CMakeFiles/TestsrcPtrPolicy.dir/TestsrcPtrPolicy.cpp.o
bin/TestsrcPtrPolicy: test/CMakeFiles/TestsrcPtrPolicy.dir/build.make
bin/TestsrcPtrPolicy: bin/libsrcsaxeventdispatch.a
bin/TestsrcPtrPolicy: bin/libsrcsax.a
bin/TestsrcPtrPolicy: /usr/lib/x86_64-linux-gnu/libxml2.so
bin/TestsrcPtrPolicy: test/CMakeFiles/TestsrcPtrPolicy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/somnus/CLionProjects/srcPtr/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/TestsrcPtrPolicy"
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestsrcPtrPolicy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/TestsrcPtrPolicy.dir/build: bin/TestsrcPtrPolicy

.PHONY : test/CMakeFiles/TestsrcPtrPolicy.dir/build

test/CMakeFiles/TestsrcPtrPolicy.dir/clean:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test && $(CMAKE_COMMAND) -P CMakeFiles/TestsrcPtrPolicy.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/TestsrcPtrPolicy.dir/clean

test/CMakeFiles/TestsrcPtrPolicy.dir/depend:
	cd /home/somnus/CLionProjects/srcPtr/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/somnus/CLionProjects/srcPtr /home/somnus/CLionProjects/srcPtr/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test /home/somnus/CLionProjects/srcPtr/cmake-build-debug/test/CMakeFiles/TestsrcPtrPolicy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/TestsrcPtrPolicy.dir/depend

