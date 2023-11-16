# Mez Ops Flutter Code Space App

## Overview
This template repository is pre-configured for developing Flutter web apps in a code space environment.

It has a pre-installed app that was created from:
     ```bash
    flutter create . --project-name sample_app --platforms web
    ```

## Getting Started

### Set Up Firebase Project
1. **Create a Firebase project**: Visit the Firebase console ([link](https://console.firebase.google.com/)) and create a new project. Initialize Firebase Hosting using default settings.

### Download Service Account Credentials
1. **Acquire Google service account credentials**: In your Firebase project, navigate to Project Settings -> Service Accounts and download the key. 

### Create Your Repository
1. **Use the template to create a repository**: Visit the template repository ([link](https://github.com/Mez-Ops/mezops-flutter-app)), click "Use this template" to create your own repo.

### Configure Repository Secrets
1. **Add secrets for GitHub actions**: In your repo, navigate to Settings -> Secrets and Variables -> Actions -> Secrets. Create a secret named `GOOGLE_APPLICATION_CREDENTIALS`.

### Initialize Code Space
1. **Start a code space**: Open a code space in your repo (Code -> Codespaces). This environment is pre-configured with Flutter, Firebase CLI, and GitHub CLI.
2. **Authenticate with Firebase CLI**:
    ```bash
    firebase login
    ```
3. **Verify GitHub CLI authentication**:
    ```bash
    gh repo list
    ```

### Initialize Firebase in Your Project
1. **Initialize Firebase**:
    ```bash
    firebase init
    ```
   Set the build directory to `build/web` and choose the hosting emulator.
2. **Add Flutter app dependencies**:
    ```bash
    dart pub global activate flutterfire_cli
    && flutter pub add firebase_core
    ```
3. **Configure Flutter app with Firebase**:
    ```bash
    flutterfire configure --platforms web
    ```

### Build and Deploy Your App
1. **Build Flutter web app**:
    ```bash
    flutter build web
    ```
2. **Deploy the app to Firebase**:
    ```bash
    firebase deploy --only hosting
    ```

### Integrate GitHub Actions
1. **Set up automatic build and deployment**: Update `.github/workflows/deploy_to_firebase.yml` with the main branch trigger. Push changes to observe the action run in the Actions tab.

### Code Space App Development
1. **Firebase emulator**: Document pending on usage (TODO).
2. **Flutter web server**: Develop using a local web server.
    ```bash
    flutter run -d web-server
    ```

### Future Enhancements (TODO)
- Add support for iOS and Android
- Integrate GitHub Pages
- Implement GitHub Actions for testing, linting, and code coverage
