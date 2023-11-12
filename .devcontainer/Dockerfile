# Use an official Ubuntu as a parent image
FROM --platform=linux/amd64 ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Copy Brewfile to /tmp
COPY Brewfile /tmp

# Install needed packages
RUN apt-get update && apt-get install -y bash curl git sudo gcc snapd

# Create a new user 'developer' and 'linuxbrew' and add it to the sudo group
RUN useradd -m developer && echo "developer:developer" | chpasswd && adduser developer sudo
RUN useradd -m linuxbrew && echo "linuxbrew:linuxbrew" | chpasswd && adduser linuxbrew sudo

# Install homebrew.
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/developer/.bashrc
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# brew bundle --file=/tmp/Brewfile

# Set the working directory in the container to the home directory of the new user
# WORKDIR /home/developer

# Set the new user as the default user
# USER developer
# Set $HOME to app
ENV HOME=/home/developer



# Install Flutter.
# https://docs.flutter.dev/get-started/install/linux

# Change the ownership of the Homebrew installation directory
# USER root
# RUN mkdir -p /home/linuxbrew/.linuxbrew && chown -R developer:developer /home/linuxbrew/.linuxbrew
USER developer

# RUN brew bundle --file=/tmp/Brewfile

# Set the default command or entry point
CMD ["/bin/bash"]