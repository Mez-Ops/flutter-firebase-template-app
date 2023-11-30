# Environemnt to install flutter and build web
FROM dart:latest AS build

# Installing prerequisites
RUN apt-get update && \
    apt-get install -y unzip curl && \
    apt-get clean

# # Installing Flutter
# RUN git clone -b stable --depth 1 https://github.com/flutter/flutter.git /flutter

# ENV PATH $PATH:/flutter/bin

# RUN flutter doctor

# RUN curl -sL firebase.tools | bash

# Create developer user
RUN useradd -m -d /app developer

COPY . /app

# WORKDIR /app
# 



USER developer

# # # give the user read/write access to the FLUTTER_SDK
# # RUN chown -R myuser:myuser $FLUTTER_SDK

# # # install all needed stuff
# # RUN apt-get update && apt-get install -y \
# #     curl \
# #     nano \
# #     sudo \
# #     git \
# #     unzip \
# #     clang \
# #     cmake \
# #     ninja-build \
# #     libgtk-3-dev \
# #     liblzma-dev \
# #     libstdc++-12-dev \
# #     pkg-config

# # RUN apt update && apt install -y \
# #     nodejs \
# #     npm \
# #     gh

# # # install firebase-cli
# # RUN npm install -g firebase-tools

# # # clone flutter
# # RUN git clone $GIT_URL $FLUTTER_SDK

# # # change dir to current flutter folder and make a checkout to the specific version
# # RUN cd $FLUTTER_SDK && git fetch && git checkout stable

# # # setup the flutter path as an enviromental variable
# # ENV PATH="$PATH:$FLUTTER_SDK/bin"

# # # set the user to developer
# # USER developer

# # # Start to run Flutter commands
# # # doctor to see if all was installs ok
# # RUN flutter channel stable
# # RUN flutter upgrade
# # RUN flutter precache
# # RUN flutter doctor -v

# # # build flutter apps
# # RUN flutter clean
# # RUN flutter pub get