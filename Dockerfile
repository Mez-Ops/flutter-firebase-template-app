# Flutter build stage
FROM node:slim

# Make apt-get not prompt for "geographic area"
ARG DEBIAN_FRONTEND=noninteractive
ARG FLUTTER_GIT_URL=https://github.com/flutter/flutter.git
ARG FLUTTER_HOME=/usr/local/flutter

# Set combined environment path
ENV PATH="/usr/local/bin/firebase:/usr/bin/java:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
# ENV PATH="${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${PATH}"

# Set environment variable for Google credentials
# Make sure to copy the service-account-key.json file to the root of the project
ENV GOOGLE_APPLICATION_CREDENTIALS /app/service-account-key.json

RUN apt-get update
RUN apt-get install -y curl git wget unzip nodejs npm default-jdk
RUN apt-get clean

# Install Node LTS
RUN npm install -g n && n lts

# Install Flutter
RUN git clone --depth 1 ${FLUTTER_GIT_URL} ${FLUTTER_HOME} --branch stable && \
    flutter channel stable && \
    flutter doctor && \
    flutter config --no-analytics && \
    dart --disable-analytics

# Install Firebase CLI
RUN npm install -g firebase-tools
