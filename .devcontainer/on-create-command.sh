
#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # Install bundle using Homebrew
# brew install bundle

# Run flutter precache
flutter precache
