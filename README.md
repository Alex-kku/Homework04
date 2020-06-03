## Homework

Представьте, что вы стажер в компании "Formatter Inc.".
### Задание 1
Вам поручили перейти на систему автоматизированной сборки **CMake**.
Исходные файлы находятся в директории [formatter_lib](formatter_lib).
В этой директории находятся файлы для статической библиотеки *formatter*.
Создайте `CMakeList.txt` в директории [formatter_lib](formatter_lib),
с помощью которого можно будет собирать статическую библиотеку *formatter*.
```sh
$ mkdir homework03
```

```sh
$ cd homework03
```

```sh
$ git clone https://github.com/tp-labs/lab03 tmp
Клонирование в «tmp»…
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 88 (delta 7), reused 4 (delta 2), pack-reused 73
Распаковка объектов: 100% (88/88), готово.
```

```sh
$ cd tmp
```

```sh
$ cd formatter_lib
```

```sh
$ cat > CMakeLists.txt <<EOF
> cmake_minimum_required(VERSION 3.4)
> project(formatter)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> set(CMAKE_CXX_STANDARD 20)
> set(CMAKE_CXX_STANDARD_REQUIRED ON)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_library(formatter STATIC \${CMAKE_CURRENT_SOURCE_DIR}/formatter.cpp)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> include_directories(\${CMAKE_CURRENT_SOURCE_DIR})
> EOF
```

```sh
$ cmake -H. -B_build
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_lib/_build
```

```sh
$ cmake --build _build
canning dependencies of target formatter
[ 50%] Building CXX object CMakeFiles/formatter.dir/formatter.cpp.o
[100%] Linking CXX static library libformatter.a
[100%] Built target formatter
```

```sh
$ ls _build/libformatter.a
_build/libformatter.a
```

### Задание 2
У компании "Formatter Inc." есть перспективная библиотека,
которая является расширением предыдущей библиотеки. Т.к. вы уже овладели
навыком созданием `CMakeList.txt` для статической библиотеки *formatter*, ваш 
руководитель поручает заняться созданием `CMakeList.txt` для библиотеки 
*formatter_ex*, которая в свою очередь использует библиотеку *formatter*.

```sh
$ cd ..
```

```sh
$ cd formatter_ex_lib
```

```sh
$ cat > CMakeLists.txt <<EOF
> cmake_minimum_required(VERSION 3.10)
> project(formatter_ex)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> set(CMAKE_CXX_STANDARD 11)
> set(CMAKE_CXX_STANDARD_REQUIRED ON)
> set(CMAKE_CURRENT_SOURCE_DIR /home/baha/Alex-kku/workspace/projects/homework03/tmp)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_library(formatter_ex STATIC \${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
> target_link_libraries(formatter_ex formatter)
> EOF
```

```sh
$ cmake -H. -B_build
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_ex_lib/_build
```

```sh
$ cmake --build _build
Scanning dependencies of target formatter_ex
[ 50%] Building CXX object CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o
[100%] Linking CXX static library libformatter_ex.a
[100%] Built target formatter_ex
```

```sh
$ ls _build/libformatter_ex.a
_build/libformatter_ex.a
```

### Задание 3
Конечно же ваша компания предоставляет примеры использования своих библиотек.
Чтобы продемонстрировать как работать с библиотекой *formatter_ex*,
вам необходимо создать два `CMakeList.txt` для двух простых приложений:
* *hello_world*, которое использует библиотеку *formatter_ex*;
* *solver*, приложение которое испольует статические библиотеки *formatter_ex* и *solver_lib*.

**Удачной стажировки!**

```sh
$ cd ..
```

```sh
$ cd  hello_world_application
```

```sh
$ cat > CMakeLists.txt <<EOF
> cmake_minimum_required(VERSION 3.10)
> project(Hello_world)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> set(CMAKE_CXX_STANDARD 11)
> set(CMAKE_CXX_STANDARD_REQUIRED ON)
> set(CMAKE_CURRENT_SOURCE_DIR /home/baha/Alex-kku/workspace/projects/homework03/tmp)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_executable(Hello_world \${CMAKE_CURRENT_SOURCE_DIR}/hello_world_application/hello_world.cpp)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib \${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
> add_library(Hello STATIC \${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp \${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
> target_link_libraries(Hello_world Hello)
> EOF
```

```sh
$ cmake -H. -B_build
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/baha/Alex-kku/workspace/projects/homework03/tmp/hello_world_application/_build
```

```sh
$  cmake --build _build
Scanning dependencies of target Hello
[ 20%] Building CXX object CMakeFiles/Hello.dir/home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_ex_lib/formatter_ex.cpp.o
[ 40%] Building CXX object CMakeFiles/Hello.dir/home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_lib/formatter.cpp.o
[ 60%] Linking CXX static library libHello.a
[ 60%] Built target Hello
Scanning dependencies of target Hello_world
[ 80%] Building CXX object CMakeFiles/Hello_world.dir/hello_world.cpp.o
[100%] Linking CXX executable Hello_world
[100%] Built target Hello_world
```

```sh
$ _build/Hello_world 
-------------------------
hello, world!
-------------------------
```

```sh
$ cd ..
```

```sh
$ cd solver_application
```

```sh
$ cat >> CMakeLists.txt <<EOF
>cmake_minimum_required(VERSION 3.10)
>project(Solver)
>set(CMAKE_CXX_STANDARD 11)
>set(CMAKE_CXX_STANDARD_REQUIRED ON)
>set(CMAKE_CURRENT_SOURCE_DIR /home/baha/Alex-kku/workspace/projects/homework03/tmp)
>add_library(solver STATIC \${CMAKE_CURRENT_SOURCE_DIR}/solver_lib/solver.cpp \${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp \${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
>EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
>include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/solver_lib \${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib \${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
>add_executable(Solver \${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)
>target_link_libraries(Solver solver)
>EOF
```

```sh
$ cmake -H. -B_build
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_application/_build
```

```sh
$ cmake --build _build
Scanning dependencies of target solver
[ 16%] Building CXX object CMakeFiles/solver.dir/home/baha/Alex-kku/workspace/projects/homework03/tmp/solver_lib/solver.cpp.o
[ 33%] Building CXX object CMakeFiles/solver.dir/home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_ex_lib/formatter_ex.cpp.o
[ 50%] Building CXX object CMakeFiles/solver.dir/home/baha/Alex-kku/workspace/projects/homework03/tmp/formatter_lib/formatter.cpp.o
[ 66%] Linking CXX static library libsolver.a
[ 66%] Built target solver
Scanning dependencies of target Solver
[ 83%] Building CXX object CMakeFiles/Solver.dir/equation.cpp.o
[100%] Linking CXX executable Solver
[100%] Built target Solver
```
```sh
$ _build/Solver
3
4
5
-------------------------
error: discriminant < 0
-------------------------
$ _build/Solver
3
12
4
-------------------------
x1 = -3.632993
-------------------------
-------------------------
x2 = -0.367007
-------------------------
```

```sh
$ cd ..
```

```sh
$ git add .
```

```sh
$ git commit -a -m "Homework done" 
[master 0a0e79e] Homework done
 166 files changed, 14465 insertions(+), 2 deletions(-)
 ```

```sh
$ git remote remove origin
```

```sh
$ git remote add origin https://github.com/Alex-kku/Homework03.git
```

```sh
$ git push origin master
Username for 'https://github.com': Alex-kku
Password for 'https://Alex-kku@github.com':**************
Подсчет объектов: 247, готово.
Delta compression using up to 8 threads.
Сжатие объектов: 100% (220/220), готово.
Запись объектов: 100% (247/247), 1.09 MiB | 311.00 KiB/s, готово.
Total 247 (delta 111), reused 0 (delta 0)
remote: Resolving deltas: 100% (111/111), done.
To https://github.com/Alex-kku/Homework03.git
 * [new branch]      master -> master
 ```
 
## Links
- [Основы сборки проектов на С/C++ при помощи CMake](https://eax.me/cmake/)
- [CMake Tutorial](http://neerc.ifmo.ru/wiki/index.php?title=CMake_Tutorial)
- [C++ Tutorial - make & CMake](https://www.bogotobogo.com/cplusplus/make.php)
- [Autotools](http://www.gnu.org/software/automake/manual/html_node/Autotools-Introduction.html)
- [CMake](https://cgold.readthedocs.io/en/latest/index.html)

```
Copyright (c) 2015-2020 The ISC Authors
```
