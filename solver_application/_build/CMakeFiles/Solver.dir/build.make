# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build

# Include any dependencies generated for this target.
include CMakeFiles/Solver.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Solver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Solver.dir/flags.make

CMakeFiles/Solver.dir/equation.cpp.o: CMakeFiles/Solver.dir/flags.make
CMakeFiles/Solver.dir/equation.cpp.o: ../equation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Solver.dir/equation.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Solver.dir/equation.cpp.o -c /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/equation.cpp

CMakeFiles/Solver.dir/equation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Solver.dir/equation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/equation.cpp > CMakeFiles/Solver.dir/equation.cpp.i

CMakeFiles/Solver.dir/equation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Solver.dir/equation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/equation.cpp -o CMakeFiles/Solver.dir/equation.cpp.s

CMakeFiles/Solver.dir/equation.cpp.o.requires:

.PHONY : CMakeFiles/Solver.dir/equation.cpp.o.requires

CMakeFiles/Solver.dir/equation.cpp.o.provides: CMakeFiles/Solver.dir/equation.cpp.o.requires
	$(MAKE) -f CMakeFiles/Solver.dir/build.make CMakeFiles/Solver.dir/equation.cpp.o.provides.build
.PHONY : CMakeFiles/Solver.dir/equation.cpp.o.provides

CMakeFiles/Solver.dir/equation.cpp.o.provides.build: CMakeFiles/Solver.dir/equation.cpp.o


# Object files for target Solver
Solver_OBJECTS = \
"CMakeFiles/Solver.dir/equation.cpp.o"

# External object files for target Solver
Solver_EXTERNAL_OBJECTS =

Solver: CMakeFiles/Solver.dir/equation.cpp.o
Solver: CMakeFiles/Solver.dir/build.make
Solver: libsolver.a
Solver: CMakeFiles/Solver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Solver"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Solver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Solver.dir/build: Solver

.PHONY : CMakeFiles/Solver.dir/build

CMakeFiles/Solver.dir/requires: CMakeFiles/Solver.dir/equation.cpp.o.requires

.PHONY : CMakeFiles/Solver.dir/requires

CMakeFiles/Solver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Solver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Solver.dir/clean

CMakeFiles/Solver.dir/depend:
	cd /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build/CMakeFiles/Solver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Solver.dir/depend

