# Mez Ops Flutter App Template

This is meant to be a simple code space where Flutter has been setup and configured. 

Below are some instructions on creating your first Flutter app.

I will be using flutter web apps primarily, but you can use this template for mobile apps as well.

# Getting Started

## Understanding this template and code spaces.

First, watch this video:

https://dev.to/pwd9000/run-self-hosted-github-runners-on-github-codespaces-video-tutorial-1ggh

or go through this tutorial:

https://dev.to/pwd9000/hosting-your-self-hosted-runners-on-github-codespaces-2elc

Note: you will need to follow along with this repo. There will be some steps where you need
to create 3 secrets in the repo using a GitHub personal access token. 

## What this code space includes

### Homebrew

This is a package manager for macOS (linuxbrew installed). It will be used to install other packages. I prefer to use this wherever possible. 

You will notice the `Brewfile` under `.devcontainer` folder in the project root. 
This is where you can add any packages you want to install in the future when the code space is spun up. 

Simply install packages with:

```bash
brew install <package>
```

Then run:

```bash
brew bundle dump
```

From the .devcontainer folder to update the Brewfile with the new package.

### Flutter SDK

The flutter sdk comes pre-installed. You can run `flutter doctor` to see the current status of your flutter installation.

#### Create your first flutter app

In the terminal, run:

```bash
flutter create <app_name>
```

To create your first flutter app.

### Firebase CLI

This CLI is used to interact with the firebase backend from the command line.
You can run `firebase login` to authenticate with your firebase account. Follow the instructions to authenticate with your google account. 

TODO: Add instructions on how to setup firebase using .json file for authentication.

### Python 3.10

This will be used if you are working with firebase functions and want to use python.


### Github CLI (gh)

This is the CLI that will make it easy to interact with your repo
in a secure manner. 

Simply run:

```bash
gh auth login
```

To log on and authenticate with github. 

## Contact

Template created, paid for, and maintained by [Mez Ops].

Contact: hello@mezops.com