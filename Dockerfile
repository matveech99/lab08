FROM ubuntu:20.04

# Установка зависимостей
RUN apt update && \
    apt install -yy \
    gcc \
    g++ \
    cmake \
    make \
    && rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию
WORKDIR /print

# Копируем только исходные файлы (исключая build-директории)
COPY . .

# Полная очистка перед сборкой
RUN rm -rf _build _install CMakeCache.txt CMakeFiles

# Сборка проекта
RUN mkdir -p _build && \
    cmake -S . -B _build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install && \
    cmake --build _build --target install -- -j$(nproc)

# Настройка окружения
ENV LOG_PATH=/home/logs/log.txt
VOLUME /home/logs

# Точка входа
WORKDIR /print/_install/bin
ENTRYPOINT ["./demo"]
