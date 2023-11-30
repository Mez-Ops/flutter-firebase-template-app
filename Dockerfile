# Environemnt to install flutter and build web
FROM dart:latest AS build

# Installing prerequisites
RUN apt-get update && \
    apt-get install -y unzip curl sudo && \
    apt-get clean

# Installing Flutter
RUN git clone -b stable --depth 1 https://github.com/flutter/flutter.git /flutter

# Set flutter path
ENV PATH $PATH:/flutter/bin

# Run flutter doctor
RUN flutter doctor

# Install firebase tools
RUN curl -sL firebase.tools | bash

# Create developer user
RUN useradd -m -d /app developer

# Set user to developer
USER developer