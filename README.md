[![Build Status](https://travis-ci.com/Alex-kku/Lab04.svg?branch=master)](https://travis-ci.com/Alex-kku/Lab04)
## Homework

Вы продолжаете проходить стажировку в "Formatter Inc." (см [подробности](https://github.com/tp-labs/lab03#Homework)).

В прошлый раз ваше задание заключалось в настройке автоматизированной системы **CMake**.

Сейчас вам требуется настроить систему непрерывной интеграции для библиотек и приложений, с которыми вы работали в [прошлый раз](https://github.com/tp-labs/lab03#Homework). Настройте сборочные процедуры на различных платформах:
* используйте [TravisCI](https://travis-ci.com/) для сборки на операционной системе **Linux** с использованием компиляторов **gcc** и **clang**;
* используйте [AppVeyor](https://www.appveyor.com/) для сборки на операционной системе **Windows**.

```sh
$ cd Alex-kku/workspace
```

```sh
$  git clone https://github.com/Alex-kku/Homework03 projects/homework04
Клонирование в «projects/homework04»…
remote: Enumerating objects: 254, done.
remote: Counting objects: 100% (254/254), done.
remote: Compressing objects: 100% (116/116), done.
remote: Total 254 (delta 115), reused 246 (delta 111), pack-reused 0
Получение объектов: 100% (254/254), 1.10 MiB | 1.06 MiB/s, готово.
Определение изменений: 100% (115/115), готово.
```

```sh
$ cd projects
$ cd homework04
```

```sh
$ git remote remove origin
```

```sh
$ git remote add origin https://github.com/Alex-kku/Homework04
```

```sh
$ cat >> CMakeLists.txt <<EOF
> cmake_minimum_required(VERSION 3.10)
> project(formatter)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> set(CMAKE_CXX_STANDARD 11)
> set(CMAKE_CXX_STANDARD_REQUIRED ON)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_library(formatter STATIC formatter_lib/formatter.cpp formatter_ex STATIC formatter_ex_lib/formatter_ex.cpp)
> include_directories(formatter_lib formatter_ex_lib)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_executable(hello_world hello_world_application/hello_world.cpp)
> target_link_libraries(hello_world formatter formatter_ex)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_library(solver_lib STATIC solver_lib/solver.cpp)
> include_directories(solver_lib)
> EOF
```

```sh
$ cat >> CMakeLists.txt <<EOF
> add_executable(solver solver_application/equation.cpp)
> target_link_libraries(solver formatter formatter_ex solver_lib)
> EOF
```

```sh
$ cat > .travis.yml <<EOF
> language: cpp
> os:
>   - linux
> EOF
```

```sh
$ cat >> script <<EOF
> cmake formatter_lib/CMakeLists.txt -Bformatter_lib/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
> cmake --build formatter_lib/_build
> cmake formatter_ex_lib/CMakeLists.txt -Bformatter_ex_lib/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
> cmake --build formatter_ex_lib/_build
> cmake hello_world_application/CMakeLists.txt -Bhello_world_application/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
> cmake --build hello_world_application/_build
> cmake solver_application/CMakeLists.txt -Bsolver_application/_build -DCMAKE_CURRENT_SOURCE_DIR=$PWD
> cmake --build solver_application/_build
> EOF
```

```sh
$ cat >> .travis.yml <<EOF
> jobs:
>   include:
>   - name: "all projects"
>     script:
>     - cmake -H. -B_build
>     - cmake --build _build
>   - name: "each CMakeLists.txt"
>     script:
>     - source ./script
> EOF
```

```sh
$ cat >> .travis.yml <<EOF
> addons:
>   apt:
>     sources:
>       - george-edison55-precise-backports
>     packages:
>       - cmake
>       - cmake-data
> EOF
```

```sh
$ travis lint
Hooray, .travis.yml looks valid :)
```

```sh
$ ex -sc '1i|[![Build Status](https://travis-ci.com/Alex-kku/Homework04.svg?branch=master)](https://travis-ci.com/Alex-kku/Homework04)' -cx README.md
```

```sh
$ git add .
```

```sh
$ git commit -m"Homework04"
[master cd3e2ee] Homework04
 165 files changed, 40 insertions(+), 14429 deletions(-)
 ```

```sh
$ git push origin master
Username for 'https://github.com': Alex-kku
Password for 'https://Alex-kku@github.com':************* 
Подсчет объектов: 264, готово.
Delta compression using up to 8 threads.
Сжатие объектов: 100% (122/122), готово.
Запись объектов: 100% (264/264), 1.10 MiB | 1.23 MiB/s, готово.
Total 264 (delta 118), reused 253 (delta 115)
remote: Resolving deltas: 100% (118/118), done.
To https://github.com/Alex-kku/Homework04
 * [new branch]      master -> master
```

## Links

- [Travis Client](https://github.com/travis-ci/travis.rb)
- [AppVeyour](https://www.appveyor.com/)
- [GitLab CI](https://about.gitlab.com/gitlab-ci/)

```
Copyright (c) 2015-2020 The ISC Authors
```
