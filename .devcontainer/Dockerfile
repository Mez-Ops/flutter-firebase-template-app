# You can pick any Debian/Ubuntu-based image. 😊
FROM --platform=linux/amd64 mcr.microsoft.com/vscode/devcontainers/base:bullseye

# Switch to the new user
USER root

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
COPY scripts/*.sh /tmp/scripts/

# cd into the user directory, download and unzip the github actions runner
RUN mkdir actions-runner && cd actions-runner

# input GitHub runner version argument
ARG RUNNER_VERSION=2.303.0

# download, extract and install dependencies for GitHub Actions runner
RUN cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && bin/installdependencies.sh && cd ..

# install homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN curl -sL https://firebase.tools | bash

# setup flutter
RUN chmod +x /tmp/scripts/setup-brew.sh && /tmp/scripts/setup-brew.sh

# TODO: auth with gh
# TODO: auth with firebase

# copy over the start.sh script
# COPY .devcontainer/scripts/start.sh actions-runner/start.sh

# make the script executable
# RUN chmod +x  actions-runner/start.sh && actions-runner/start.sh

# Clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/scripts

# Switch back to vscode user
USER vscode