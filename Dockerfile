FROM ubuntu:latest AS build

# Install Dependencies.
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git \
    wget \
    curl \
    unzip \
    libglu1-mesa \
    libgtk-3-dev \
    clang \
    cmake \
    ca-certificates \
    ninja-build \
    pkg-config \
    nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
RUN bash -c 'source ~/.nvm/nvm.sh && nvm install --lts && npm install -g firebase-tools'


ENV FLUTTER_ROOT="/opt/flutter"
RUN git clone -b stable https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"

# Install Flutter SDK
RUN flutter config --no-analytics --enable-linux-desktop
RUN flutter precache --web --no-android --no-ios --linux --no-windows --no-macos --no-fuchsia --no-universal
RUN flutter doctor -v