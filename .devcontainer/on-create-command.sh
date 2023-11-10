
#!/bin/bash
set -eo pipefail

# fix permissions so Homebrew and Bundler don't complain
# sudo chmod -R g-w,o-w /home/linuxbrew

# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # Install bundle using Homebrew
# brew install bundle

# Run flutter precache
flutter precache
