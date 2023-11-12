# Use an official Ubuntu as a parent image
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

USER root

# Copy Brewfile to /tmp
COPY Brewfile /tmp

# Update apt-get
RUN apt-get update -y

# Install Basics
RUN apt-get install -y sudo unzip wget

# Install Flutter dependencies for Linux (desktop dev)
# Reference: https://docs.flutter.dev/get-started/install/linux#linux-prerequisites
RUN apt-get install -y clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Install Flutter dependencies for Linux (system requirements)
# https://docs.flutter.dev/get-started/install/linux#system-requirements
RUN apt-get install -y bash curl gcc git libglu1-mesa xz-utils

# Cleanup
RUN apt-get clean

# Create a new user 'developer' and 'linuxbrew' and add it to the sudo group
RUN useradd -m developer && adduser developer sudo

# Install homebrew.
# Reference: https://brew.sh/
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
# Make the developer user the owner of the homebrew directory
RUN sudo chown -R developer /home/linuxbrew/
# Add brew to path.
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Install Flutter
# Reference: https://docs.flutter.dev/get-started/install/linux#method-2-manual-installation
RUN curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.9-stable.tar.xz && \
    tar xf flutter_linux_3.13.9-stable.tar.xz -C /opt && \
    rm flutter_linux_3.13.9-stable.tar.xz
ENV PATH="/opt/flutter/bin:$PATH"

# Switch to the developer user
USER developer

# Cache Flutter dependencies
RUN flutter precache

# Install Brewfile
RUN brew update && brew bundle --file=/tmp/Brewfile