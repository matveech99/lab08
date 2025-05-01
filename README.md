Проделанная работа:
Создаётся Dockerfile на основе Ubuntu 18.04, в котором устанавливаются необходимые инструменты (gcc, g++, cmake), копируется исходный код приложения и настраивается сборка через CMake. В Dockerfile также указывается путь для логов и точка входа для запуска демо-приложения.
Далее устанавливается сам  Docker. После сборки запускается контейнер, монтируя локальную папку logs для сохранения логов. В процессе работы контейнера вводятся несколько строк текста, которые сохраняются в лог-файл.



> cd ${GITHUB_USERNAME}/workspace
> pushd .
~/matveech99/workspace ~
> source scripts/activate
> git clone https://github.com/${GITHUB_USERNAME}/lab07 lab08
Клонирование в «lab08»...
remote: Enumerating objects: 375, done.
remote: Counting objects: 100% (375/375), done.
remote: Compressing objects: 100% (174/174), done.
remote: Total 375 (delta 164), reused 371 (delta 163), pack-reused 0 (from 0)
Получение объектов: 100% (375/375), 2.13 МиБ | 3.96 МиБ/с, готово.
Определение изменений: 100% (164/164), готово.
> cd lab08
> git submodule update --init
Подмодуль «tools/polly» (https://github.com/ruslo/polly) зарегистрирован по пути «tools/polly»
Клонирование в «/home/matvey/matveech99/workspace/lab08/tools/polly»...
Submodule path 'tools/polly': checked out 'ef7e79c2c297d456f2742fd0b976f555d058d4e0'
> git remote remove origin
> git remote add origin https://github.com/${GITHUB_USERNAME}/lab08
> cat > Dockerfile <<EOF
FROM ubuntu:18.04
EOF
> cat >> Dockerfile <<EOF

RUN apt update
RUN apt install -yy gcc g++ cmake
EOF
> cat >> Dockerfile <<EOF

COPY . print/
WORKDIR print
EOF
> cat >> Dockerfile <<EOF

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
EOF
> cat >> Dockerfile <<EOF

ENV LOG_PATH /home/logs/log.txt
EOF
> cat >> Dockerfile <<EOF

VOLUME /home/logs
EOF
> cat >> Dockerfile <<EOF

WORKDIR _install/bin
EOF
> cat >> Dockerfile <<EOF

ENTRYPOINT ./demo
EOF
> docker build -t logger .
zsh: command not found: docker
> sudo apt-get install docker.io
[sudo] пароль для matvey: 
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Следующие пакеты устанавливались автоматически и больше не требуются:
  libpkcs11-helper1t64 python3-netifaces
Для их удаления используйте «sudo apt autoremove».
Будут установлены следующие дополнительные пакеты:
  bridge-utils containerd pigz runc ubuntu-fan
Предлагаемые пакеты:
  ifupdown aufs-tools btrfs-progs cgroupfs-mount | cgroup-lite debootstrap docker-buildx
  docker-compose-v2 docker-doc rinse zfs-fuse | zfsutils
Следующие НОВЫЕ пакеты будут установлены:
  bridge-utils containerd docker.io pigz runc ubuntu-fan
Обновлено 0 пакетов, установлено 6 новых пакетов, для удаления отмечено 0 пакетов, и 107 пакетов не обновлено.
Необходимо скачать 78,2 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 301 MB.
Хотите продолжить? [Д/н] y
Пол:1 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 pigz amd64 2.8-1 [65,6 kB]
Пол:2 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 bridge-utils amd64 1.7.1-1ubuntu2 [33,9 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 runc amd64 1.1.12-0ubuntu3.1 [8 599 kB]
Пол:4 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 containerd amd64 1.7.24-0ubuntu1~24.04.2 [37,0 MB]
Пол:5 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 docker.io amd64 26.1.3-0ubuntu1~24.04.1 [32,4 MB]
Пол:6 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 ubuntu-fan all 0.12.16 [35,2 kB]           
Получено 78,2 MB за 18с (4 331 kB/s)                                                                      
Предварительная настройка пакетов …
Выбор ранее не выбранного пакета pigz.
(Чтение базы данных … на данный момент установлено 257452 файла и каталога.)
Подготовка к распаковке …/0-pigz_2.8-1_amd64.deb …
Распаковывается pigz (2.8-1) …
Выбор ранее не выбранного пакета bridge-utils.
Подготовка к распаковке …/1-bridge-utils_1.7.1-1ubuntu2_amd64.deb …
Распаковывается bridge-utils (1.7.1-1ubuntu2) …
Выбор ранее не выбранного пакета runc.
Подготовка к распаковке …/2-runc_1.1.12-0ubuntu3.1_amd64.deb …
Распаковывается runc (1.1.12-0ubuntu3.1) …
Выбор ранее не выбранного пакета containerd.
Подготовка к распаковке …/3-containerd_1.7.24-0ubuntu1~24.04.2_amd64.deb …
Распаковывается containerd (1.7.24-0ubuntu1~24.04.2) …
Выбор ранее не выбранного пакета docker.io.
Подготовка к распаковке …/4-docker.io_26.1.3-0ubuntu1~24.04.1_amd64.deb …
Распаковывается docker.io (26.1.3-0ubuntu1~24.04.1) …
Выбор ранее не выбранного пакета ubuntu-fan.
Подготовка к распаковке …/5-ubuntu-fan_0.12.16_all.deb …
Распаковывается ubuntu-fan (0.12.16) …
Настраивается пакет runc (1.1.12-0ubuntu3.1) …
Настраивается пакет bridge-utils (1.7.1-1ubuntu2) …
Настраивается пакет pigz (2.8-1) …
Настраивается пакет containerd (1.7.24-0ubuntu1~24.04.2) …
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /usr/lib/systemd/system/containerd.service.
Настраивается пакет ubuntu-fan (0.12.16) …
Created symlink /etc/systemd/system/multi-user.target.wants/ubuntu-fan.service → /usr/lib/systemd/system/ubuntu-fan.service.
Настраивается пакет docker.io (26.1.3-0ubuntu1~24.04.1) …
info: Выбирается GID из диапазона от 100 по 999 ...
info: Добавляется группа «docker» (GID 126) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /usr/lib/systemd/system/docker.socket.
Обрабатываются триггеры для man-db (2.12.0-4build2) …
> docker build -t logger .
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.45/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&shmsize=0&t=logger&target=&ulimits=%5B%5D&version=1": dial unix /var/run/docker.sock: connect: permission denied
> sudo usermod -aG docker $USER
> newgrp docker
> docker build -t logger .
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  12.07MB
Step 1/10 : FROM ubuntu:20.04
 ---> b7bab04fd9aa
Step 2/10 : RUN apt update &&     apt install -yy     gcc     g++     cmake     make     && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> 2fe392daa7ff
Step 3/10 : WORKDIR /print
 ---> Using cache
 ---> 7577d1c468c7
Step 4/10 : COPY . .
 ---> f1df8de93c08
Step 5/10 : RUN rm -rf _build _install CMakeCache.txt CMakeFiles
 ---> Running in e329df012ca7
 ---> Removed intermediate container e329df012ca7
 ---> eaf5d2c924e7
Step 6/10 : RUN mkdir -p _build &&     cmake -S . -B _build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install &&     cmake --build _build --target install -- -j$(nproc)
 ---> Running in 67c392469853
-- [hunter] Initializing Hunter workspace (23f1b5a0acffae50fda423388c843a8e7b6e1eb0)
-- [hunter]   https://github.com/cpp-pm/hunter/archive/v0.23.308.tar.gz
-- [hunter]   -> /root/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a
-- The C compiler identification is GNU 9.4.0
-- The CXX compiler identification is GNU 9.4.0
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
-- [hunter] Calculating Toolchain-SHA1
-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /root/.hunter
-- [hunter] [ Hunter-ID: 23f1b5a | Toolchain-ID: f845a29 | Config-ID: bf2be25 ]
-- [hunter] GTEST_ROOT: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Install (ver.: 1.11.0)
-- [hunter] Building GTest
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/cache.cmake
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/args.cmake
-- The C compiler identification is GNU 9.4.0
-- The CXX compiler identification is GNU 9.4.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Build
Scanning dependencies of target GTest-Release
[  6%] Creating directories for 'GTest-Release'
[ 12%] Performing download step (download, verify and extract) for 'GTest-Release'
-- Downloading...
   dst='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
   timeout='none'
-- Using src='https://github.com/google/googletest/archive/release-1.11.0.tar.gz'
-- [download 0% complete]
-- [download 1% complete]
-- [download 2% complete]
-- [download 5% complete]
-- [download 8% complete]
-- [download 9% complete]
-- [download 12% complete]
-- [download 15% complete]
-- [download 17% complete]
-- [download 18% complete]
-- [download 19% complete]
-- [download 21% complete]
-- [download 27% complete]
-- [download 32% complete]
-- [download 34% complete]
-- [download 36% complete]
-- [download 39% complete]
-- [download 40% complete]
-- [download 45% complete]
-- [download 46% complete]
-- [download 48% complete]
-- [download 51% complete]
-- [download 58% complete]
-- [download 59% complete]
-- [download 60% complete]
-- [download 61% complete]
-- [download 62% complete]
-- [download 63% complete]
-- [download 64% complete]
-- [download 65% complete]
-- [download 70% complete]
-- [download 72% complete]
-- [download 74% complete]
-- [download 75% complete]
-- [download 77% complete]
-- [download 78% complete]
-- [download 82% complete]
-- [download 86% complete]
-- [download 90% complete]
-- [download 92% complete]
-- [download 94% complete]
-- [download 96% complete]
-- [download 98% complete]
-- [download 100% complete]
-- verifying file...
       file='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
-- Downloading... done
-- extracting...
     src='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
     dst='/root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 18%] No patch step for 'GTest-Release'
[ 25%] No update step for 'GTest-Release'
[ 31%] Performing configure step for 'GTest-Release'
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/cache.cmake
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/args.cmake
-- The C compiler identification is GNU 9.4.0
-- The CXX compiler identification is GNU 9.4.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Could NOT find Python (missing: Python_EXECUTABLE Interpreter) 
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - found
-- Found Threads: TRUE  
-- Configuring done
-- Generating done
-- Build files have been written to: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Build/GTest-Release-prefix/src/GTest-Release-build
[ 37%] Performing build step for 'GTest-Release'
Scanning dependencies of target gtest
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtest.a
[ 25%] Built target gtest
Scanning dependencies of target gtest_main
Scanning dependencies of target gmock
[ 37%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 50%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_main.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmock.a
[ 75%] Built target gmock
Scanning dependencies of target gmock_main
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_main.a
[100%] Built target gmock_main
[ 43%] Performing install step for 'GTest-Release'
[ 25%] Built target gtest
[ 50%] Built target gmock
[ 75%] Built target gmock_main
[100%] Built target gtest_main
Install the project...
-- Install configuration: "Release"
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-actions.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgmock.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgmock_main.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestTargets-release.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-message.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-spi.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-printers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest_prod.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgtest.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgtest_main.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/args.cmake
[ 50%] Completed 'GTest-Release'
[ 50%] Built target GTest-Release
Scanning dependencies of target GTest-Debug
[ 56%] Creating directories for 'GTest-Debug'
[ 62%] Performing download step (download, verify and extract) for 'GTest-Debug'
-- verifying file...
       file='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
-- File already exists and hash match (skip download):
  file='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
  SHA1='7b100bb68db8df1060e178c495f3cbe941c9b058'
-- extracting...
     src='/root/.hunter/_Base/Download/GTest/1.11.0/7b100bb/release-1.11.0.tar.gz'
     dst='/root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 68%] No patch step for 'GTest-Debug'
[ 75%] No update step for 'GTest-Debug'
[ 81%] Performing configure step for 'GTest-Debug'
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/cache.cmake
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/args.cmake
-- The C compiler identification is GNU 9.4.0
-- The CXX compiler identification is GNU 9.4.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Could NOT find Python (missing: Python_EXECUTABLE Interpreter) 
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - found
-- Found Threads: TRUE  
-- Configuring done
-- Generating done
-- Build files have been written to: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Build/GTest-Debug-prefix/src/GTest-Debug-build
[ 87%] Performing build step for 'GTest-Debug'
Scanning dependencies of target gtest
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtestd.a
[ 25%] Built target gtest
Scanning dependencies of target gtest_main
Scanning dependencies of target gmock
[ 37%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 50%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_maind.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmockd.a
[ 75%] Built target gmock
Scanning dependencies of target gmock_main
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_maind.a
[100%] Built target gmock_main
[ 93%] Performing install step for 'GTest-Debug'
[ 25%] Built target gtest
[ 50%] Built target gmock
[ 75%] Built target gmock_main
[100%] Built target gtest_main
Install the project...
-- Install configuration: "Debug"
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-actions.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgmockd.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgmock_maind.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestTargets-debug.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-message.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-spi.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-printers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest_prod.h
-- Up-to-date: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgtestd.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/libgtest_maind.a
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest/args.cmake
[100%] Completed 'GTest-Debug'
[100%] Built target GTest-Debug
-- [hunter] Build step successful (dir: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Build/GTest)
-- [hunter] Cache saved: /root/.hunter/_Base/Cache/raw/ee8f7c07fcab7c4ffe23257e7b1d07a76b2ad259.tar.bz2
-- Found GTest: /root/.hunter/_Base/23f1b5a/f845a29/bf2be25/Install/lib/cmake/GTest/GTestConfig.cmake (found version "1.11.0")  
-- Configuring done
-- Generating done
-- Build files have been written to: /print/_build
Scanning dependencies of target print
[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
Scanning dependencies of target demo
[ 75%] Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o
[100%] Linking CXX executable demo
[100%] Built target demo
Install the project...
-- Install configuration: "Release"
-- Installing: /print/_install/lib/libprint.a
-- Installing: /print/_install/include
-- Installing: /print/_install/include/print.hpp
-- Installing: /print/_install/cmake/print-config.cmake
-- Installing: /print/_install/cmake/print-config-release.cmake
-- Installing: /print/_install/bin/demo
 ---> Removed intermediate container 67c392469853
 ---> 033e01c3e931
Step 7/10 : ENV LOG_PATH=/home/logs/log.txt
 ---> Running in 6ae1d53f5ca2
 ---> Removed intermediate container 6ae1d53f5ca2
 ---> 3cb81dc75ce9
Step 8/10 : VOLUME /home/logs
 ---> Running in 679ed7012449
 ---> Removed intermediate container 679ed7012449
 ---> 7277d0b8181b
Step 9/10 : WORKDIR /print/_install/bin
 ---> Running in ea904022154d
 ---> Removed intermediate container ea904022154d
 ---> 1adae89144d4
Step 10/10 : ENTRYPOINT ["./demo"]
 ---> Running in 17fdb20a7412
 ---> Removed intermediate container 17fdb20a7412
 ---> 6103f0cc5644
Successfully built 6103f0cc5644
Successfully tagged logger:latest
> docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
logger        latest    6103f0cc5644   4 minutes ago    378MB
<none>        <none>    b780c6c3006f   17 minutes ago   355MB
<none>        <none>    7bad411e5ba9   20 minutes ago   344MB
<none>        <none>    a684cd1a12a0   25 minutes ago   345MB
<none>        <none>    adeb41536854   28 minutes ago   345MB
ubuntu        20.04     b7bab04fd9aa   3 weeks ago      72.8MB
hello-world   latest    74cc54e27dc4   3 months ago     10.1kB
ubuntu        18.04     f9a80a55f492   23 months ago    63.2MB
> mkdir logs

> docker run -it -v "$(pwd)/logs:/home/logs" logger
text1
text2
text3
<C-D>
^C
> docker inspect logger
[
    {
        "Id": "sha256:6103f0cc56448e8ab4394e7612132f07ea2019846c7b8dfbf55b8be55055dd2c",
        "RepoTags": [
            "logger:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:1adae89144d4bd8c07f4817bef422763856efab2ee5b0b68b53e85c13922e350",
        "Comment": "",
        "Created": "2025-05-01T10:55:11.558587911Z",
        "DockerVersion": "26.1.3",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "LOG_PATH=/home/logs/log.txt"
            ],
            "Cmd": null,
            "Image": "sha256:1adae89144d4bd8c07f4817bef422763856efab2ee5b0b68b53e85c13922e350",
            "Volumes": {
                "/home/logs": {}
            },
            "WorkingDir": "/print/_install/bin",
            "Entrypoint": [
                "./demo"
            ],
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "20.04"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 377681965,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/538ea35437f1d75c9cba7e41c4ef4ed6fba18994b8bfb07ba362a9cbaa6a6d8b/diff:/var/lib/docker/overlay2/5c6486ec2c8bbc4634357e94b85413253cb3cd641d3bba6a9c5b6780a5bd9f96/diff:/var/lib/docker/overlay2/bde567e6079fa150dccf5d7fc0bb491b67f3a5741c3945e4fe8d3c42809e7b68/diff:/var/lib/docker/overlay2/29ae2d69726c1bb7644a17cc8c723a7944db92bb60c709c5754dfb2d1dbbe1eb/diff:/var/lib/docker/overlay2/9af7baeb3fd3f6a462ceff5799c0d35d07d2f6bf15c9c9ed4544cef40d4fd251/diff",
                "MergedDir": "/var/lib/docker/overlay2/618d2dc58203ed1a96f982dfd90726eda81bfdb1a482e075c5537758ac6b0213/merged",
                "UpperDir": "/var/lib/docker/overlay2/618d2dc58203ed1a96f982dfd90726eda81bfdb1a482e075c5537758ac6b0213/diff",
                "WorkDir": "/var/lib/docker/overlay2/618d2dc58203ed1a96f982dfd90726eda81bfdb1a482e075c5537758ac6b0213/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:470b66ea5123c93b0d5606e4213bf9e47d3d426b640d32472e4ac213186c4bb6",
                "sha256:36d81fd7e70ad3086ac2bd31b90c40d199ede57c343c0212be0eca86a3ef10a6",
                "sha256:cf3125bcf0148ebf6338e2e3ec8ccd86dcbb4211697a1df33e509550a4b2b903",
                "sha256:0b5d69c0a1311c73a85ea936b24f5dcb4ef3262d7b0bb3ab0494adb73c7ab05e",
                "sha256:2d43aa2216e04450667645fee2cb15b5b76be461d2942c992af797b7d914f742",
                "sha256:0830128ea4e276867300ef7551fe5521785af9f7556a623f0044f5cad889771c"
            ]
        },
        "Metadata": {
            "LastTagTime": "2025-05-01T13:55:11.584225703+03:00"
        }
    }
]
> cat logs/log.txt
cat: logs/log.txt: Нет такого файла или каталога
> cat logs/log.txt
е�text1
text2
text3
<C-D>
> gsed -i 's/lab07/lab08/g' README.md


zsh: command not found: gsed
> alias gsed=sed
> gsed -i 's/lab07/lab08/g' README.md


> vim .travis.yml
> git add Dockerfile
> git add .travis.yml
> git add .
> git commit -m"adding Dockerfile"
[main 8f35921] adding Dockerfile
 4 files changed, 96 insertions(+), 54 deletions(-)
 create mode 100644 Dockerfile
 create mode 100644 logs/log.txt
> git push origin main
Перечисление объектов: 382, готово.
Подсчет объектов: 100% (382/382), готово.
При сжатии изменений используется до 16 потоков
Сжатие объектов: 100% (178/178), готово.
Запись объектов: 100% (382/382), 2.13 МиБ | 3.64 МиБ/с, готово.
Всего 382 (изменений 167), повторно использовано 372 (изменений 164), повторно использовано пакетов 0
remote: Resolving deltas: 100% (167/167), done.
To https://github.com/matveech99/lab08
 * [new branch]      main -> main
