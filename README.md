Какая работа была проделана:
Переход в рабочую директорию, сохранение текущего пути (pushd), активация окружения (например, переменных среды).
Копирование lab06 в lab08, смена URL репозитория.
Добавление Hunter в проект для управления зависимостями (Gtest).
Удаление встроенного GTest, замена на версию через Hunter.
Конфигурация, сборка и запуск тестов.
Использование локальной копии Hunter для контроля версий.
Создание demo/main.cpp и добавление его в сборку.
Интеграция Polly для сборки с Clang и C++14.
 
 
 
 
 
 
 
 
 alias gsed=sed
> cd ${GITHUB_USERNAME}/workspace
> pushd .
~/matveech99/workspace ~
> source scripts/activate
> git clone https://github.com/${GITHUB_USERNAME}/lab06 projects/lab08
Клонирование в «projects/lab08»...
remote: Enumerating objects: 219, done.
remote: Counting objects: 100% (219/219), done.
remote: Compressing objects: 100% (119/119), done.
remote: Total 219 (delta 78), reused 213 (delta 75), pack-reused 0 (from 0)
Получение объектов: 100% (219/219), 1.25 МиБ | 3.72 МиБ/с, готово.
Определение изменений: 100% (78/78), готово.
> cd projects/lab08
> git remote remove origin
> git remote add origin https://github.com/${GITHUB_USERNAME}/lab08
> mkdir -p cmake
> wget https://raw.githubusercontent.com/cpp-pm/gate/master/cmake/HunterGate.cmake -O cmake/HunterGate.cmake
--2025-05-01 11:40:43--  https://raw.githubusercontent.com/cpp-pm/gate/master/cmake/HunterGate.cmake
Распознаётся raw.githubusercontent.com (raw.githubusercontent.com)… 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
Подключение к raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 200 OK
Длина: 17231 (17K) [text/plain]
Сохранение в: ‘cmake/HunterGate.cmake’

cmake/HunterGate.cmake     100%[=======================================>]  16,83K  --.-KB/s    за 0,003s  

2025-05-01 11:40:43 (5,68 MB/s) - ‘cmake/HunterGate.cmake’ сохранён [17231/17231]




> gsed -i '/cmake_minimum_required(VERSION 3.4)/a \
include("cmake/HunterGate.cmake")\n\
HunterGate(\n\
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.308.tar.gz"\n\
    SHA1 "23f1b5a0acffae50fda423388c843a8e7b6e1eb0"\n\
)' CMakeLists.txt
> git rm -rf third-party/gtest
rm 'third-party/gtest'
> gsed -i '/set(PRINT_VERSION_STRING "v\${PRINT_VERSION}")/a hunter_add_package(GTest)\n\nfind_package(GTest CONFIG REQUIRED)' CMakeLists.txt
> gsed -i 's/add_subdirectory(third-party\/gtest)//' CMakeLists.txt
> gsed -i 's/gtest_main/GTest::main/' CMakeLists.txt

> cmake -H. -B_builds -DBUILD_TESTS=ON
CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_set_config_location.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:13 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:34 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_private_data.cmake:12 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:35 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_initialize.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/Hunter:36 (include)
  cmake/HunterGate.cmake:540 (include)
  CMakeLists.txt:4 (HunterGate)


-- [hunter] Calculating Toolchain-SHA1
CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /home/matvey/.hunter
-- [hunter] [ Hunter-ID: 23f1b5a | Toolchain-ID: fb15dbb | Config-ID: bf2be25 ]
CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_set_config_location.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:13 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_config_sha1.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:9 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_toolchain_sha1.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:10 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_set_config_location.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_apply_gate_settings.cmake:13 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_calculate_self.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_finalize.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_cache_run.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_create_cache_meta_directory.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_create_cache_meta_directory.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_load_from_cache.cmake:6 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:22 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_create_cache_meta_directory.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_save_to_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:26 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_create_cache_meta_directory.cmake:5 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_save_to_cache.cmake:4 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:26 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_save_to_cache.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:26 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_save_to_cache.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:26 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


CMake Deprecation Warning at /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_lock_directory.cmake:4 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.
Call Stack (most recent call first):
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_make_directory.cmake:7 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_save_to_cache.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_download.cmake:26 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/projects/GTest/hunter.cmake:8 (include)
  /home/matvey/.hunter/_Base/Download/Hunter/0.23.308/23f1b5a/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
  CMakeLists.txt:24 (hunter_add_package)


-- [hunter] GTEST_ROOT: /home/matvey/.hunter/_Base/23f1b5a/fb15dbb/bf2be25/Install (ver.: 1.11.0)
-- Configuring done (0.6s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/matveech99/workspace/projects/lab08/_builds
~/m/workspace/p/lab08 main +2 !1 ?2 >     








> cmake --build _builds
[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
[ 75%] Building CXX object CMakeFiles/check.dir/tests/test1.cpp.o
[100%] Linking CXX executable check
[100%] Built target check
> cmake --build _builds --target test
Running tests...
Test project /home/matvey/matveech99/workspace/projects/lab08/_builds
    Start 1: check
1/1 Test #1: check ............................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.00 sec
> ls -la $HOME/.hunter
итого 12
drwxrwxr-x  3 matvey matvey 4096 мая  1 12:10 .
drwxr-x--- 29 matvey matvey 4096 мая  1 12:17 ..
drwxrwxr-x  6 matvey matvey 4096 мая  1 12:10 _Base
~/m/workspace/p/lab08 main +2 !1 ?2 >
> git clone https://github.com/cpp-pm/hunter $HOME/projects/hunter
Клонирование в «/home/matvey/projects/hunter»...
remote: Enumerating objects: 54405, done.
remote: Counting objects: 100% (1563/1563), done.
remote: Compressing objects: 100% (446/446), done.
remote: Total 54405 (delta 1316), reused 1159 (delta 1114), pack-reused 52842 (from 3)
Получение объектов: 100% (54405/54405), 13.98 МиБ | 4.01 МиБ/с, готово.
Определение изменений: 100% (33841/33841), готово.
> export HUNTER_ROOT=$HOME/projects/hunter
> rm -rf _builds
> cmake -H. -B_builds -DBUILD_TESTS=ON
CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- [hunter] Calculating Toolchain-SHA1
-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /home/matvey/projects/hunter
-- [hunter] [ Hunter-ID: xxxxxxx | Toolchain-ID: fb15dbb | Config-ID: cf272be ]
-- [hunter] GTEST_ROOT: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install (ver.: 1.15.2)
-- [hunter] Building GTest
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/args.cmake
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.1s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Build
[  6%] Creating directories for 'GTest-Release'
[ 12%] Performing download step (download, verify and extract) for 'GTest-Release'
-- Downloading...
   dst='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
   timeout='none'
   inactivity timeout='none'
-- Using src='https://github.com/google/googletest/archive/v1.15.2.tar.gz'
-- [download 0% complete]
-- [download 2% complete]
-- [download 4% complete]
-- [download 5% complete]
-- [download 6% complete]
-- [download 10% complete]
-- [download 11% complete]
-- [download 12% complete]
-- [download 13% complete]
-- [download 15% complete]
-- [download 20% complete]
-- [download 21% complete]
-- [download 25% complete]
-- [download 28% complete]
-- [download 33% complete]
-- [download 38% complete]
-- [download 42% complete]
-- [download 48% complete]
-- [download 54% complete]
-- [download 57% complete]
-- [download 58% complete]
-- [download 60% complete]
-- [download 66% complete]
-- [download 72% complete]
-- [download 77% complete]
-- [download 82% complete]
-- [download 87% complete]
-- [download 88% complete]
-- [download 89% complete]
-- [download 93% complete]
-- [download 94% complete]
-- [download 95% complete]
-- [download 100% complete]
-- verifying file...
       file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
-- Downloading... done
-- extracting...
     src='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
     dst='/home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 18%] No update step for 'GTest-Release'
[ 25%] No patch step for 'GTest-Release'
[ 31%] Performing configure step for 'GTest-Release'
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/args.cmake
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE  
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Build/GTest-Release-prefix/src/GTest-Release-build
[ 37%] Performing build step for 'GTest-Release'
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtest.a
[ 25%] Built target gtest
[ 50%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 50%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_main.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmock.a
[ 75%] Built target gmock
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_main.a
[100%] Built target gmock_main
[ 43%] Performing install step for 'GTest-Release'
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgmock.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgmock_main.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets-release.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-message.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-spi.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest_prod.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-assertion-result.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgtest.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgtest_main.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/args.cmake
[ 50%] Completed 'GTest-Release'
[ 50%] Built target GTest-Release
[ 56%] Creating directories for 'GTest-Debug'
[ 62%] Performing download step (download, verify and extract) for 'GTest-Debug'
-- verifying file...
       file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
-- File already exists and hash match (skip download):
  file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
  SHA1='568d58e26bd4e838449ca7ab8ebc152b3cbd210d'
-- extracting...
     src='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
     dst='/home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 68%] No update step for 'GTest-Debug'
[ 75%] No patch step for 'GTest-Debug'
[ 81%] Performing configure step for 'GTest-Debug'
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/args.cmake
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE  
-- Configuring done (0.1s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Build/GTest-Debug-prefix/src/GTest-Debug-build
[ 87%] Performing build step for 'GTest-Debug'
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtestd.a
[ 25%] Built target gtest
[ 37%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 50%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_maind.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmockd.a
[ 75%] Built target gmock
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_maind.a
[100%] Built target gmock_main
[ 93%] Performing install step for 'GTest-Debug'
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-actions.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgmockd.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgmock_maind.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets-debug.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-message.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-spi.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest_prod.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/include/gtest/gtest-assertion-result.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgtestd.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/libgtest_maind.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest/args.cmake
[100%] Completed 'GTest-Debug'
[100%] Built target GTest-Debug
-- [hunter] Build step successful (dir: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Build/GTest)
-- [hunter] Cache saved: /home/matvey/projects/hunter/_Base/Cache/raw/8a641d0f6835881411f16f627c469663704ad474.tar.bz2
-- Found GTest: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install/lib/cmake/GTest/GTestConfig.cmake (found version "1.15.2")  
-- Configuring done (18.3s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/matveech99/workspace/projects/lab08/_builds
~/m/workspace/p/lab08 main +2 !1 ?2 >


> cmake --build _builds
[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
[ 75%] Building CXX object CMakeFiles/check.dir/tests/test1.cpp.o
[100%] Linking CXX executable check
[100%] Built target check
> cmake --build _builds --target test
Running tests...
Test project /home/matvey/matveech99/workspace/projects/lab08/_builds
    Start 1: check
1/1 Test #1: check ............................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.00 sec
~/m/workspace/p/lab08 main +2 !1 ?2 >           
> cat $HUNTER_ROOT/cmake/configs/default.cmake | grep GTest
  hunter_default_version(GTest VERSION 1.7.0-hunter-6)
  hunter_default_version(GTest VERSION 1.15.2)
> cat $HUNTER_ROOT/cmake/projects/GTest/hunter.cmake
# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter.tar.gz"
    SHA1
    1ed1c26d11fb592056c1cb912bd3c784afa96eaa
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-1"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-1.tar.gz"
    SHA1
    0cb1dcf75e144ad052d3f1e4923a7773bf9b494f
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-2"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-2.tar.gz"
    SHA1
    e62b2ef70308f63c32c560f7b6e252442eed4d57
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-3"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-3.tar.gz"
    SHA1
    fea7d3020e20f059255484c69755753ccadf6362
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-4"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-4.tar.gz"
    SHA1
    9b439c0c25437a083957b197ac6905662a5d901b
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-5"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-5.tar.gz"
    SHA1
    796804df3facb074087a4d8ba6f652e5ac69ad7f
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-6"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz"
    SHA1
    64b93147abe287da8fe4e18cfd54ba9297dafb82
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-7"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-7.tar.gz"
    SHA1
    19b5c98747768bcd0622714f2ed40f17aee406b2
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-8"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-8.tar.gz"
    SHA1
    ac4d2215aa1b1d745a096e5e3b2dbe0c0f229ea5
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-9"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-9.tar.gz"
    SHA1
    8a47fe9c4e550f4ed0e2c05388dd291a059223d9
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-10"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-10.tar.gz"
    SHA1
    374e6dbe8619ab467c6b1a0b470a598407b172e9
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.7.0-hunter-11"
    URL
    "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-11.tar.gz"
    SHA1
    c6ae948ca2bea1d734af01b1069491b00933ed31
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p2
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p2.tar.gz"
    SHA1
    93148cb8850abe78b76ed87158fdb6b9c48e38c4
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p5
    URL https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p5.tar.gz
    SHA1 3325aa4fc8b30e665c9f73a60f19387b7db36f85
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p6
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p6.tar.gz"
    SHA1
    f57096bd01c6f8cbef043b312d4d1e82f29648b6
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p7
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz"
    SHA1
    4fe083a96d7597f7dce6f453dca01e1d94a1e45b
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p8
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p8.tar.gz"
    SHA1
    1cdd396b20c8d29f7ea08baaa49673b1c261f545
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p9
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p9.tar.gz"
    SHA1
    a345f16cb610e0b5dfa7778dc2852b784cfede5b
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    1.8.0-hunter-p10
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p10.tar.gz"
    SHA1
    1d92c9f51af756410843b13f8c4e4df09e235394
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.8.0-hunter-p11"
    URL
    "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p11.tar.gz"
    SHA1
    76c6aec038f7d7258bf5c4f45c4817b34039d285
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.8.1"
    URL
    "https://github.com/google/googletest/archive/release-1.8.1.tar.gz"
    SHA1
    152b849610d91a9dfa1401293f43230c2e0c33f8
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.10.0"
    URL
    "https://github.com/google/googletest/archive/release-1.10.0.tar.gz"
    SHA1
    9c89be7df9c5e8cb0bc20b3c4b39bf7e82686770
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.10.0-p0"
    URL
    "https://github.com/hunter-packages/googletest/archive/v1.10.0-p0.tar.gz"
    SHA1
    f7c72be12120e018f53cda0e0daa26fab5da7dfc
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.10.0-p1"
    URL
    "https://github.com/hunter-packages/googletest/archive/v1.10.0-p1.tar.gz"
    SHA1
    06a1f667f200ff94d38b608e44c3c8061c7b8f2f
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.11.0"
    URL
    "https://github.com/google/googletest/archive/release-1.11.0.tar.gz"
    SHA1
    7b100bb68db8df1060e178c495f3cbe941c9b058
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.12.1"
    URL
    "https://github.com/google/googletest/archive/release-1.12.1.tar.gz"
    SHA1
    cdddd449d4e3aa7bd421d4519c17139ea1890fe7
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.13.0"
    URL
    "https://github.com/google/googletest/archive/v1.13.0.tar.gz"
    SHA1
    bfa4b5131b6eaac06962c251742c96aab3f7aa78
)

hunter_add_version(
    PACKAGE_NAME
    GTest
    VERSION
    "1.14.0"
    URL
    "https://github.com/google/googletest/archive/v1.14.0.tar.gz"
    SHA1
    2b28c2a3a30d86b1759543ef61fac3c4d69f8c4c
)

hunter_add_version(
        PACKAGE_NAME
        GTest
        VERSION
        "1.15.2"
        URL
        "https://github.com/google/googletest/archive/v1.15.2.tar.gz"
        SHA1
        568d58e26bd4e838449ca7ab8ebc152b3cbd210d
)


if(HUNTER_GTest_VERSION VERSION_LESS 1.8.0 OR HUNTER_GTest_VERSION VERSION_GREATER_EQUAL 1.11.0)
  set(_gtest_license "LICENSE")
else()
  set(_gtest_license "googletest/LICENSE")
endif()

# gtest_force_shared_crt prevents GoogleTest from modifying options
# rather than forcing it to use shared libraries
hunter_cmake_args(
    GTest
    CMAKE_ARGS
    HUNTER_INSTALL_LICENSE_FILES=${_gtest_license}
    gtest_force_shared_crt=TRUE
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GTest)
hunter_download(PACKAGE_NAME GTest PACKAGE_INTERNAL_DEPS_ID 1)
> mkdir cmake/Hunter
> cat > cmake/Hunter/config.cmake <<EOF
hunter_config(GTest VERSION 1.7.0-hunter-9)
EOF
~/m/workspace/p/lab08 main +2 !1 ?2 >    
> mkdir demo
> cat > demo/main.cpp <<EOF
#include <print.hpp>

#include <cstdlib>

int main(int argc, char* argv[])
{
  const char* log_path = std::getenv("LOG_PATH");
  if (log_path == nullptr)
  {
    std::cerr << "undefined environment variable: LOG_PATH" << std::endl;
    return 1;
  }
  std::string text;
  while (std::cin >> text)
  {
    std::ofstream out{log_path, std::ios_base::app};
    print(text, out);
    out << std::endl;
  }
}
EOF



> mkdir tools
> sudo apt clang
[sudo] пароль для matvey: 
E: Неверная операция clang
> git submodule add https://github.com/ruslo/polly tools/polly
Клонирование в «/home/matvey/matveech99/workspace/projects/lab08/tools/polly»...
remote: Enumerating objects: 6578, done.
remote: Counting objects: 100% (32/32), done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 6578 (delta 21), reused 20 (delta 17), pack-reused 6546 (from 1)
Получение объектов: 100% (6578/6578), 1.68 МиБ | 1.61 МиБ/с, готово.
Определение изменений: 100% (4551/4551), готово.
> tools/polly/bin/polly.py --test
Python version: 3.12
Build dir: /home/matvey/matveech99/workspace/projects/lab08/_builds/default
Execute command: [
  `which`
  `cmake`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "which" "cmake"

/usr/bin/cmake
Execute command: [
  `cmake`
  `--version`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--version"

cmake version 3.28.3

CMake suite maintained and supported by Kitware (kitware.com/cmake).
Execute command: [
  `cmake`
  `-H.`
  `-B/home/matvey/matveech99/workspace/projects/lab08/_builds/default`
  `-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/default.cmake`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "-H." "-B/home/matvey/matveech99/workspace/projects/lab08/_builds/default" "-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/default.cmake"

CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- [polly] Used toolchain: Default
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- [hunter] Calculating Toolchain-SHA1
-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /home/matvey/projects/hunter
-- [hunter] [ Hunter-ID: xxxxxxx | Toolchain-ID: fb15dbb | Config-ID: cf272be ]
-- [hunter] GTEST_ROOT: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install (ver.: 1.15.2)
-- Found GTest: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install/lib/cmake/GTest/GTestConfig.cmake (found version "1.15.2")
-- Configuring done (0.7s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/matveech99/workspace/projects/lab08/_builds/default
Execute command: [
  `cmake`
  `--build`
  `/home/matvey/matveech99/workspace/projects/lab08/_builds/default`
  `--`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--build" "/home/matvey/matveech99/workspace/projects/lab08/_builds/default" "--"

[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
[ 75%] Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o
[100%] Linking CXX executable demo
[100%] Built target demo
Run tests
Execute command: [
  `ctest`
]

[/home/matvey/matveech99/workspace/projects/lab08/_builds/default]> "ctest"

*********************************
No test configuration file found!
*********************************
Usage

  ctest [options]

-
Log saved: /home/matvey/matveech99/workspace/projects/lab08/_logs/polly/default/log.txt
-
Generate: 0:00:01.721082s
Build: 0:00:01.404698s
Test: 0:00:00.006546s
-
Total: 0:00:03.132457s
-
SUCCESS
> tools/polly/bin/polly.py --install --clear
Python version: 3.12
Build dir: /home/matvey/matveech99/workspace/projects/lab08/_builds/default
Remove directory: /home/matvey/matveech99/workspace/projects/lab08/_builds/default
Execute command: [
  `which`
  `cmake`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "which" "cmake"

/usr/bin/cmake
Execute command: [
  `cmake`
  `--version`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--version"

cmake version 3.28.3

CMake suite maintained and supported by Kitware (kitware.com/cmake).
Execute command: [
  `cmake`
  `-H.`
  `-B/home/matvey/matveech99/workspace/projects/lab08/_builds/default`
  `-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/default.cmake`
  `-DCMAKE_INSTALL_PREFIX=/home/matvey/matveech99/workspace/projects/lab08/_install/default`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "-H." "-B/home/matvey/matveech99/workspace/projects/lab08/_builds/default" "-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/default.cmake" "-DCMAKE_INSTALL_PREFIX=/home/matvey/matveech99/workspace/projects/lab08/_install/default"

CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- [polly] Used toolchain: Default
-- The C compiler identification is GNU 13.3.0
-- The CXX compiler identification is GNU 13.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- [hunter] Calculating Toolchain-SHA1
-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /home/matvey/projects/hunter
-- [hunter] [ Hunter-ID: xxxxxxx | Toolchain-ID: fb15dbb | Config-ID: cf272be ]
-- [hunter] GTEST_ROOT: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install (ver.: 1.15.2)
-- Found GTest: /home/matvey/projects/hunter/_Base/xxxxxxx/fb15dbb/cf272be/Install/lib/cmake/GTest/GTestConfig.cmake (found version "1.15.2")
-- Configuring done (0.9s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/matveech99/workspace/projects/lab08/_builds/default
Execute command: [
  `cmake`
  `--build`
  `/home/matvey/matveech99/workspace/projects/lab08/_builds/default`
  `--target`
  `install`
  `--`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--build" "/home/matvey/matveech99/workspace/projects/lab08/_builds/default" "--target" "install" "--"

[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
[ 75%] Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o
[100%] Linking CXX executable demo
[100%] Built target demo
Install the project...
-- Install configuration: ""
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/lib/libprint.a
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/include
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/include/print.hpp
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/cmake/print-config.cmake
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/cmake/print-config-noconfig.cmake
-- Installing: /home/matvey/matveech99/workspace/projects/lab08/_install/default/bin/demo
-
Log saved: /home/matvey/matveech99/workspace/projects/lab08/_logs/polly/default/log.txt
-
Generate: 0:00:01.915187s
Build: 0:00:01.432174s
-
Total: 0:00:03.347605s
-
SUCCESS
> sudo apt-get install clang clang-format lldb
[sudo] пароль для matvey: 
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Следующие пакеты устанавливались автоматически и больше не требуются:
  libpkcs11-helper1t64 python3-netifaces
Для их удаления используйте «sudo apt autoremove».
Будут установлены следующие дополнительные пакеты:
  clang-18 clang-format-18 lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-common-18-dev libclang-rt-18-dev
  liblldb-18 libobjc-13-dev libobjc4 libpfm4 libxml2-dev libz3-4 libz3-dev lldb-18 llvm-18 llvm-18-dev
  llvm-18-linker-tools llvm-18-runtime llvm-18-tools python3-lldb-18
Предлагаемые пакеты:
  clang-18-doc wasi-libc llvm-18-doc
Следующие НОВЫЕ пакеты будут установлены:
  clang clang-18 clang-format clang-format-18 lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-common-18-dev
  libclang-rt-18-dev liblldb-18 libobjc-13-dev libobjc4 libpfm4 libxml2-dev libz3-4 libz3-dev lldb
  lldb-18 llvm-18 llvm-18-dev llvm-18-linker-tools llvm-18-runtime llvm-18-tools python3-lldb-18
Обновлено 0 пакетов, установлено 24 новых пакетов, для удаления отмечено 0 пакетов, и 107 пакетов не обновлено.
Необходимо скачать 94,1 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 587 MB.
Хотите продолжить? [Д/н] y
Пол:1 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 libobjc4 amd64 14.2.0-4ubuntu2~24.04 [47,0 kB]
Пол:2 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 libobjc-13-dev amd64 13.3.0-6ubuntu2~24.04 [194 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 libclang-common-18-dev amd64 1:18.1.3-1ubuntu1 [736 kB]
Пол:4 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 llvm-18-linker-tools amd64 1:18.1.3-1ubuntu1 [1 314 kB]
Пол:5 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 clang-18 amd64 1:18.1.3-1ubuntu1 [80,0 kB]
Пол:6 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 clang amd64 1:18.0-59~exp2 [5 846 B]
Пол:7 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 clang-format-18 amd64 1:18.1.3-1ubuntu1 [53,8 kB]
Пол:8 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 clang-format amd64 1:18.0-59~exp2 [5 970 B]
Пол:9 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 libc6-i386 amd64 2.39-0ubuntu8.4 [2 787 kB]
Пол:10 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 lib32gcc-s1 amd64 14.2.0-4ubuntu2~24.04 [92,3 kB]
Пол:11 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 lib32stdc++6 amd64 14.2.0-4ubuntu2~24.04 [814 kB]
Пол:12 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 libclang-rt-18-dev amd64 1:18.1.3-1ubuntu1 [3 772 kB]
Пол:13 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 liblldb-18 amd64 1:18.1.3-1ubuntu1 [4 243 kB]
Пол:14 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 libxml2-dev amd64 2.9.14+dfsg-1.3ubuntu3.3 [780 kB]
Пол:15 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 python3-lldb-18 amd64 1:18.1.3-1ubuntu1 [113 kB]
Пол:16 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 lldb-18 amd64 1:18.1.3-1ubuntu1 [1 222 kB]
Пол:17 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 lldb amd64 1:18.0-59~exp2 [5 678 B]
Пол:18 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 llvm-18-runtime amd64 1:18.1.3-1ubuntu1 [538 kB]
Пол:19 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 libpfm4 amd64 4.13.0+git32-g0d4ed0e-1 [414 kB]
Пол:20 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 llvm-18 amd64 1:18.1.3-1ubuntu1 [25,3 MB]
Пол:21 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 llvm-18-tools amd64 1:18.1.3-1ubuntu1 [534 kB]
Пол:22 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 libz3-4 amd64 4.8.12-3.1build1 [5 836 kB] 
Пол:23 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 libz3-dev amd64 4.8.12-3.1build1 [72,2 kB]
Пол:24 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 llvm-18-dev amd64 1:18.1.3-1ubuntu1 [45,1 MB]
Получено 94,1 MB за 19с (5 057 kB/s)                                                                      
Выбор ранее не выбранного пакета libobjc4:amd64.
(Чтение базы данных … на данный момент установлено 253295 файлов и каталогов.)
Подготовка к распаковке …/00-libobjc4_14.2.0-4ubuntu2~24.04_amd64.deb …
Распаковывается libobjc4:amd64 (14.2.0-4ubuntu2~24.04) …
Выбор ранее не выбранного пакета libobjc-13-dev:amd64.
Подготовка к распаковке …/01-libobjc-13-dev_13.3.0-6ubuntu2~24.04_amd64.deb …
Распаковывается libobjc-13-dev:amd64 (13.3.0-6ubuntu2~24.04) …
Выбор ранее не выбранного пакета libclang-common-18-dev:amd64.
Подготовка к распаковке …/02-libclang-common-18-dev_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается libclang-common-18-dev:amd64 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета llvm-18-linker-tools.
Подготовка к распаковке …/03-llvm-18-linker-tools_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается llvm-18-linker-tools (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета clang-18.
Подготовка к распаковке …/04-clang-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается clang-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета clang.
Подготовка к распаковке …/05-clang_1%3a18.0-59~exp2_amd64.deb …
Распаковывается clang (1:18.0-59~exp2) …
Выбор ранее не выбранного пакета clang-format-18.
Подготовка к распаковке …/06-clang-format-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается clang-format-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета clang-format:amd64.
Подготовка к распаковке …/07-clang-format_1%3a18.0-59~exp2_amd64.deb …
Распаковывается clang-format:amd64 (1:18.0-59~exp2) …
Выбор ранее не выбранного пакета libc6-i386.
Подготовка к распаковке …/08-libc6-i386_2.39-0ubuntu8.4_amd64.deb …
Распаковывается libc6-i386 (2.39-0ubuntu8.4) …
Выбор ранее не выбранного пакета lib32gcc-s1.
Подготовка к распаковке …/09-lib32gcc-s1_14.2.0-4ubuntu2~24.04_amd64.deb …
Распаковывается lib32gcc-s1 (14.2.0-4ubuntu2~24.04) …
Выбор ранее не выбранного пакета lib32stdc++6.
Подготовка к распаковке …/10-lib32stdc++6_14.2.0-4ubuntu2~24.04_amd64.deb …
Распаковывается lib32stdc++6 (14.2.0-4ubuntu2~24.04) …
Выбор ранее не выбранного пакета libclang-rt-18-dev:amd64.
Подготовка к распаковке …/11-libclang-rt-18-dev_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается libclang-rt-18-dev:amd64 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета liblldb-18.
Подготовка к распаковке …/12-liblldb-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается liblldb-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета libxml2-dev:amd64.
Подготовка к распаковке …/13-libxml2-dev_2.9.14+dfsg-1.3ubuntu3.3_amd64.deb …
Распаковывается libxml2-dev:amd64 (2.9.14+dfsg-1.3ubuntu3.3) …
Выбор ранее не выбранного пакета python3-lldb-18.
Подготовка к распаковке …/14-python3-lldb-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается python3-lldb-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета lldb-18.
Подготовка к распаковке …/15-lldb-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается lldb-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета lldb:amd64.
Подготовка к распаковке …/16-lldb_1%3a18.0-59~exp2_amd64.deb …
Распаковывается lldb:amd64 (1:18.0-59~exp2) …
Выбор ранее не выбранного пакета llvm-18-runtime.
Подготовка к распаковке …/17-llvm-18-runtime_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается llvm-18-runtime (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета libpfm4:amd64.
Подготовка к распаковке …/18-libpfm4_4.13.0+git32-g0d4ed0e-1_amd64.deb …
Распаковывается libpfm4:amd64 (4.13.0+git32-g0d4ed0e-1) …
Выбор ранее не выбранного пакета llvm-18.
Подготовка к распаковке …/19-llvm-18_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается llvm-18 (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета llvm-18-tools.
Подготовка к распаковке …/20-llvm-18-tools_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается llvm-18-tools (1:18.1.3-1ubuntu1) …
Выбор ранее не выбранного пакета libz3-4:amd64.
Подготовка к распаковке …/21-libz3-4_4.8.12-3.1build1_amd64.deb …
Распаковывается libz3-4:amd64 (4.8.12-3.1build1) …
Выбор ранее не выбранного пакета libz3-dev:amd64.
Подготовка к распаковке …/22-libz3-dev_4.8.12-3.1build1_amd64.deb …
Распаковывается libz3-dev:amd64 (4.8.12-3.1build1) …
Выбор ранее не выбранного пакета llvm-18-dev.
Подготовка к распаковке …/23-llvm-18-dev_1%3a18.1.3-1ubuntu1_amd64.deb …
Распаковывается llvm-18-dev (1:18.1.3-1ubuntu1) …
Настраивается пакет clang-format-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет liblldb-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет libobjc4:amd64 (14.2.0-4ubuntu2~24.04) …
Настраивается пакет llvm-18-tools (1:18.1.3-1ubuntu1) …
Настраивается пакет libxml2-dev:amd64 (2.9.14+dfsg-1.3ubuntu3.3) …
Настраивается пакет libz3-4:amd64 (4.8.12-3.1build1) …
Настраивается пакет libpfm4:amd64 (4.13.0+git32-g0d4ed0e-1) …
Настраивается пакет libclang-common-18-dev:amd64 (1:18.1.3-1ubuntu1) …
Настраивается пакет llvm-18-linker-tools (1:18.1.3-1ubuntu1) …
Настраивается пакет libc6-i386 (2.39-0ubuntu8.4) …
Настраивается пакет llvm-18-runtime (1:18.1.3-1ubuntu1) …
Настраивается пакет python3-lldb-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет libobjc-13-dev:amd64 (13.3.0-6ubuntu2~24.04) …
Настраивается пакет libz3-dev:amd64 (4.8.12-3.1build1) …
Настраивается пакет clang-format:amd64 (1:18.0-59~exp2) …
Настраивается пакет clang-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет lldb-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет lib32gcc-s1 (14.2.0-4ubuntu2~24.04) …
Настраивается пакет lib32stdc++6 (14.2.0-4ubuntu2~24.04) …
Настраивается пакет clang (1:18.0-59~exp2) …
Настраивается пакет llvm-18 (1:18.1.3-1ubuntu1) …
Настраивается пакет libclang-rt-18-dev:amd64 (1:18.1.3-1ubuntu1) …
Настраивается пакет lldb:amd64 (1:18.0-59~exp2) …
Настраивается пакет llvm-18-dev (1:18.1.3-1ubuntu1) …
Обрабатываются триггеры для systemd (255.4-1ubuntu8.6) …
Обрабатываются триггеры для man-db (2.12.0-4build2) …
Обрабатываются триггеры для libc-bin (2.39-0ubuntu8.4) …
> clang --version
Ubuntu clang version 18.1.3 (1ubuntu1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
> tools/polly/bin/polly.py --toolchain clang-cxx14
Python version: 3.12
Build dir: /home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14
Execute command: [
  `which`
  `cmake`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "which" "cmake"

/usr/bin/cmake
Execute command: [
  `cmake`
  `--version`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--version"

cmake version 3.28.3

CMake suite maintained and supported by Kitware (kitware.com/cmake).
Execute command: [
  `cmake`
  `-H.`
  `-B/home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14`
  `-GUnix Makefiles`
  `-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/clang-cxx14.cmake`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "-H." "-B/home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14" "-GUnix Makefiles" "-DCMAKE_TOOLCHAIN_FILE=/home/matvey/matveech99/workspace/projects/lab08/tools/polly/clang-cxx14.cmake"

CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- [polly] Used toolchain: clang / c++14 support
-- The C compiler identification is Clang 18.1.3
-- The CXX compiler identification is Clang 18.1.3
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/clang - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/clang++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- [hunter] Calculating Toolchain-SHA1
-- [hunter] Calculating Config-SHA1
-- [hunter] HUNTER_ROOT: /home/matvey/projects/hunter
-- [hunter] [ Hunter-ID: xxxxxxx | Toolchain-ID: 71bad34 | Config-ID: cf272be ]
-- [hunter] GTEST_ROOT: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Install (ver.: 1.15.2)
-- [hunter] Building GTest
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/args.cmake
-- [polly] Used toolchain: clang / c++14 support
-- The C compiler identification is Clang 18.1.3
-- The CXX compiler identification is Clang 18.1.3
-- Check for working C compiler: /usr/bin/clang - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/clang++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Build
[  6%] Creating directories for 'GTest-Release'
[ 12%] Performing download step (download, verify and extract) for 'GTest-Release'
-- verifying file...
       file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
-- File already exists and hash match (skip download):
  file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
  SHA1='568d58e26bd4e838449ca7ab8ebc152b3cbd210d'
-- extracting...
     src='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
     dst='/home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 18%] No update step for 'GTest-Release'
[ 25%] No patch step for 'GTest-Release'
[ 31%] Performing configure step for 'GTest-Release'
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/args.cmake
-- [polly] Used toolchain: clang / c++14 support
-- The C compiler identification is Clang 18.1.3
-- The CXX compiler identification is Clang 18.1.3
-- Check for working C compiler: /usr/bin/clang - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/clang++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Build/GTest-Release-prefix/src/GTest-Release-build
[ 37%] Performing build step for 'GTest-Release'
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtest.a
[ 25%] Built target gtest
[ 37%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 50%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_main.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmock.a
[ 75%] Built target gmock
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_main.a
[100%] Built target gmock_main
[ 43%] Performing install step for 'GTest-Release'
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgmock.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgmock_main.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets-release.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-message.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-spi.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest_prod.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-assertion-result.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgtest.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgtest_main.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/args.cmake
[ 50%] Completed 'GTest-Release'
[ 50%] Built target GTest-Release
[ 56%] Creating directories for 'GTest-Debug'
[ 62%] Performing download step (download, verify and extract) for 'GTest-Debug'
-- verifying file...
       file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
-- File already exists and hash match (skip download):
  file='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
  SHA1='568d58e26bd4e838449ca7ab8ebc152b3cbd210d'
-- extracting...
     src='/home/matvey/projects/hunter/_Base/Download/GTest/1.15.2/568d58e/v1.15.2.tar.gz'
     dst='/home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Source'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 68%] No update step for 'GTest-Debug'
[ 75%] No patch step for 'GTest-Debug'
[ 81%] Performing configure step for 'GTest-Debug'
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/cache.cmake
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/args.cmake
-- [polly] Used toolchain: clang / c++14 support
-- The C compiler identification is Clang 18.1.3
-- The CXX compiler identification is Clang 18.1.3
-- Check for working C compiler: /usr/bin/clang - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/clang++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Build/GTest-Debug-prefix/src/GTest-Debug-build
[ 87%] Performing build step for 'GTest-Debug'
[ 12%] Building CXX object googletest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 25%] Linking CXX static library ../lib/libgtestd.a
[ 25%] Built target gtest
[ 50%] Building CXX object googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[ 50%] Building CXX object googletest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 62%] Linking CXX static library ../lib/libgtest_maind.a
[ 62%] Built target gtest_main
[ 75%] Linking CXX static library ../lib/libgmockd.a
[ 75%] Built target gmock
[ 87%] Building CXX object googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[100%] Linking CXX static library ../lib/libgmock_maind.a
[100%] Built target gmock_main
[ 93%] Performing install step for 'GTest-Debug'
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-actions.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-internal-utils.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/gmock-pp.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-more-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-more-actions.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-spec-builders.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-cardinalities.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-function-mocker.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gmock/gmock-nice-strict.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgmockd.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgmock_maind.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gmock.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gmock_main.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestTargets-debug.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-message.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port-arch.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-string.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-param-util.h
-- Up-to-date: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/README.md
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-port.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/custom/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-type-util.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-internal.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/internal/gtest-filepath.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-spi.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-death-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-test-part.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-param-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-printers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest_pred_impl.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-matchers.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest_prod.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-typed-test.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/include/gtest/gtest-assertion-result.h
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgtestd.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/libgtest_maind.a
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gtest.pc
-- Installing: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/Install/lib/pkgconfig/gtest_main.pc
loading initial cache file /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest/args.cmake
[100%] Completed 'GTest-Debug'
[100%] Built target GTest-Debug
-- [hunter] Build step successful (dir: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Build/GTest)
-- [hunter] Cache saved: /home/matvey/projects/hunter/_Base/Cache/raw/a5603b396f5e333b202fce25d9241aaa967dcc93.tar.bz2
-- Found GTest: /home/matvey/projects/hunter/_Base/xxxxxxx/71bad34/cf272be/Install/lib/cmake/GTest/GTestConfig.cmake (found version "1.15.2")
-- Configuring done (14.4s)
-- Generating done (0.0s)
-- Build files have been written to: /home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14
Execute command: [
  `cmake`
  `--build`
  `/home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14`
  `--`
]

[/home/matvey/matveech99/workspace/projects/lab08]> "cmake" "--build" "/home/matvey/matveech99/workspace/projects/lab08/_builds/clang-cxx14" "--"

[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o
[ 50%] Linking CXX static library libprint.a
[ 50%] Built target print
[ 75%] Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o
[100%] Linking CXX executable demo
[100%] Built target demo
-
Log saved: /home/matvey/matveech99/workspace/projects/lab08/_logs/polly/clang-cxx14/log.txt
-
Generate: 0:00:15.382033s
Build: 0:00:01.497794s
-
Total: 0:00:16.879934s
-
SUCCESS
