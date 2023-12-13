# Flutter build stage
FROM ubuntu:24.04 as flutter-build

# Make apt-get not prompt for "geographic area"
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies for Flutter
RUN apt-get update && \
    apt-get install -y curl git wget unzip && \
    apt-get clean

# Download Flutter SDK from Flutter GitHub repo
RUN git clone --depth 1 https://github.com/flutter/flutter.git /usr/local/flutter --branch stable

# Set Flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Setup Flutter
RUN flutter channel stable && \
    flutter doctor && \
    flutter config --enable-web --no-analytics && \
    flutter precache

# Firebase build stage
FROM node:latest as firebase-build

# Install Firebase CLI
RUN npm install -g firebase-tools

# Set firebase environment path
ENV PATH="/usr/local/bin/firebase:${PATH}"

# Setup Firebase
RUN firebase --version && \
    firebase setup:emulators:firestore

# Final build stage
FROM ubuntu:24.04 as final-build

# Make apt-get not prompt for "geographic area"
ARG DEBIAN_FRONTEND=noninteractive

# Install Java and Node.js
RUN apt-get update && \
    apt-get install -y default-jdk nodejs npm && \
    apt-get clean

# Copy Flutter from the Flutter build stage
COPY --from=flutter-build /usr/local/flutter /usr/local/flutter

# Copy Firebase CLI from the Firebase build stage
COPY --from=firebase-build /usr/local/bin/firebase /usr/local/bin/firebase

# Set combined environment path
ENV PATH="/usr/local/bin/firebase:/usr/bin/java:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Set environment variable for Google credentials
ENV GOOGLE_APPLICATION_CREDENTIALS /app/service-account-key.json

# Copy project files
COPY . /app
WORKDIR /app

# Add Firebase emulator start command alias
RUN echo "alias fems='firebase emulators:start'" >> ~/.bash




# # I'm not aware of an official flutter build image, so building our own.
# FROM ubuntu as build
# # Make apt-get not prompt for "geographic area"
# ARG DEBIAN_FRONTEND=noninteractive

# # Set flutter, firebase, and java environment path
# ENV PATH="/usr/local/bin/firebase:/usr/bin/java:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# COPY . /app

# # Set environment variable for Google credentials
# ENV GOOGLE_APPLICATION_CREDENTIALS /app/service-account-key.json

# # Install Dart and Flutter
# RUN apt-get update
# RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa nodejs npm default-jdk
# RUN apt-get clean

# RUN java --version

# # Update to latest node
# RUN npm install -g n && n lts

# RUN node --version

# # download Flutter SDK from Flutter Github repo
# RUN git clone --depth 1 https://github.com/flutter/flutter.git /usr/local/flutter --branch stable

# WORKDIR /app

# # Setup Flutter
# RUN flutter channel stable
# RUN flutter doctor
# RUN flutter config --enable-web --no-analytics
# RUN flutter precache
# RUN flutter --version

# # Setup Firebase CLI
# RUN npm install -g firebase-tools
# RUN firebase use default
# RUN firebase --version
# RUN firebase setup:emulators:firestore

# RUN echo "alias fems='firebase emulators:start'" >> ~/.bashrc