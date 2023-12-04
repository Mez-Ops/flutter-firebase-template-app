# FROM node:latest AS firebase-build

# # Install and setup firebase
# RUN npm install -g firebase-tools

# FROM ubuntu:latest AS build

# # set bash as default shell
# SHELL ["/bin/bash", "-c"]

# # Install apt packages
# RUN apt update && \
# 	apt install -y \
# 	curl \
# 	nano \
# 	git \
# 	unzip \
# 	python3 \
# 	python3-pip \
# 	clang \
# 	cmake \
# 	ninja-build \
# 	pkg-config \
# 	libgtk-3-dev \
# 	liblzma-dev && \
# 	apt clean

# # User args
# RUN useradd -ms /bin/bash developer

# # Switch to user
# USER ${USER}

# WORKDIR ${HOME}

# # Install and setup flutter
# RUN git clone -b stable https://github.com/flutter/flutter.git
# ENV PATH="${HOME}/.pub-cache/bin:${HOME}/flutter/bin:${HOME}/flutter/bin/cache/dart-sdk/bin:$PATH"
# RUN flutter config --enable-web --no-analytics --enable-linux-desktop

# # Expose the port
# EXPOSE 8080



