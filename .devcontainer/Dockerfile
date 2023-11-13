# Use an official Ubuntu as a parent image
FROM --platform=linux/amd64 ghcr.io/cirruslabs/flutter:stable

# Copy Brewfile to /tmp
COPY Brewfile /tmp

# Create the developer user
RUN useradd -m developer

RUN sudo apt-get update -y

RUN sudo apt-get install -y clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

RUN sudo chown -R developer /sdks/flutter

# Install homebrew.
# Reference: https://brew.sh/
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
# Make the developer user the owner of the homebrew directory
RUN sudo chown -R developer /home/linuxbrew/
# Add brew to path.
ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

USER developer

RUN brew bundle --file=/tmp/Brewfile




# # Create a new user 'developer' and 'linuxbrew' and add it to the sudo group
#  && adduser developer sudo



# 

# # Cache Flutter dependencies
# RUN flutter precache

# # Install Brewfile
# 
