# I'm not aware of an official flutter build image, so building our own.
FROM ubuntu as build
# Make apt-get not prompt for "geographic area"
ARG DEBIAN_FRONTEND=noninteractive

COPY . /app

# Set environment variable for Google credentials
ENV GOOGLE_APPLICATION_CREDENTIALS /app/service-account-key.json

# Install Dart and Flutter
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa nodejs npm default-jdk
RUN apt-get clean

RUN java --version

# Update to latest node
RUN npm install -g n && n lts

RUN node --version

# download Flutter SDK from Flutter Github repo
RUN git clone --depth 1 https://github.com/flutter/flutter.git /usr/local/flutter --branch stable

# Set flutter and java environment path
ENV PATH="/usr/bin/java:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Setup Flutter
RUN flutter channel stable
# RUN flutter config --enable-web
RUN flutter doctor

RUN flutter --version

# Install Firebase CLI
RUN npm install -g firebase-tools && firebase use default
RUN firebase --version

EXPOSE 4400