# Use an official Ubuntu as a parent image
FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

USER root

# Copy Brewfile to /tmp
COPY Brewfile /tmp

# Install needed packages
RUN apt-get update -y
RUN apt-get install -y bash sudo xz-utils curl git gcc wget unzip libglu1-mesa build-essential clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
RUN apt-get clean

# Create a new user 'developer' and 'linuxbrew' and add it to the sudo group
RUN useradd -m developer && adduser developer sudo

# Install homebrew.
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
RUN sudo chown -R developer /home/linuxbrew/
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Install Flutter
RUN curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.9-stable.tar.xz && \
    tar xf flutter_linux_3.13.9-stable.tar.xz -C /opt && \
    rm flutter_linux_3.13.9-stable.tar.xz
ENV PATH="/opt/flutter/bin:$PATH"

USER developer

RUN flutter precache
RUN brew update && brew bundle --file=/tmp/Brewfile