FROM ubuntu:24.04@sha256:008173c23f95b170204355c12626cb5a965d779a7e1283b09e9cffbb1bf33ca3

ARG DEBIAN_FRONTEND=noninteractive
ARG HOST_UID=1000
ARG HOST_GID=1000

# doc/ubuntu_build.md lists the Ubuntu packages but still targets 20.04.
# The pinned avcpp uses C++20 std::format, so use the 24.04 release tested by
# .github/workflows/impacto.yml and a pinned CMake required by vcpkg.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git cmake ninja-build build-essential libstdc++6 nasm curl zip pkg-config \
    autoconf autoconf-archive automake libtool libx11-dev libxft-dev \
    libxext-dev libwayland-dev libxkbcommon-dev libegl1-mesa-dev \
    libibus-1.0-dev xcb libxrandr-dev ca-certificates python3-venv \
    unzip libdrm-dev \
    && rm -rf /var/lib/apt/lists/*
# Required by vcpkg's libxcrypt and SDL3 X11 ports; all are in Linux CI.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libltdl-dev libxcursor-dev libxfixes-dev libxi-dev libxss-dev libxtst-dev \
    && rm -rf /var/lib/apt/lists/*
RUN python3 -m venv /opt/cmake-env \
    && /opt/cmake-env/bin/pip install --no-cache-dir 'cmake==3.31.10'
ENV PATH=/opt/cmake-env/bin:$PATH

ENV VCPKG_ROOT=/opt/vcpkg
RUN git clone https://github.com/microsoft/vcpkg.git "$VCPKG_ROOT" \
    && git -C "$VCPKG_ROOT" checkout 62159a45e18f3a9ac0548628dcaf74fcb60c6ff9 \
    && if [ "$(id -u ubuntu)" != "$HOST_UID" ]; then usermod --uid "$HOST_UID" ubuntu; fi \
    && if [ "$(id -g ubuntu)" != "$HOST_GID" ]; then groupmod --gid "$HOST_GID" ubuntu; fi \
    && chown -R ubuntu:ubuntu "$VCPKG_ROOT" /home/ubuntu

USER ubuntu
RUN "$VCPKG_ROOT/bootstrap-vcpkg.sh" -disableMetrics \
    && cmake --version \
    && "$VCPKG_ROOT/vcpkg" version

WORKDIR /workspace/impacto
