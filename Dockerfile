# Environemnt to install flutter and build web
FROM debian:latest AS build-env

# install all needed stuff
RUN apt-get update && apt-get install -y \
    curl \
    nano \
    sudo \
    git \
    unzip \
    clang \
    cmake \
    ninja-build \
    libgtk-3-dev \
    liblzma-dev \
    libstdc++-12-dev \
    pkg-config

RUN apt update && apt install -y \
    nodejs \
    npm \
    gh

# install firebase-cli
RUN npm install -g firebase-tools

# define variables
ARG GIT_URL=https://github.com/flutter/flutter.git
ARG FLUTTER_SDK=/usr/local/flutter
ARG APP=/app/

# clone flutter
RUN git clone $GIT_URL $FLUTTER_SDK

# change dir to current flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK && git fetch && git checkout stable

# setup the flutter path as an enviromental variable
ENV PATH="$PATH:$FLUTTER_SDK/bin"
ENV LC_ALL="en.utf-8"

# Start to run Flutter commands
# doctor to see if all was installes ok
RUN flutter channel stable
RUN flutter upgrade
RUN flutter precache
RUN flutter doctor -v

# create folder to copy source code
RUN mkdir $APP
# copy source code to folder
COPY . $APP
# setup new folder as the working directory
WORKDIR $APP

# build flutter apps
RUN flutter clean
RUN flutter pub get
RUN flutter build linux
RUN flutter build web