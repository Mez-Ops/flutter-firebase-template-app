# Mez Ops Flutter Code Space App

This is a template repository that comes pre-configured with
a code space environment that is setup for developing Flutter web
apps.

TODO: Add more platform support for Flutter. 

## Getting Started

# Create repository from the template

Ensure GitHub

1. Go to the template repository for Mez-Ops: https://github.com/Mez-Ops/mezops-flutter-app
2. Select template -> new repository
3. Select code -> code space from main
4. Authenticate with Firebase CLI
5. Ensure authed with GitHub CLI
gh repo list
gh auth token
6. Run `firebase init` to setup Firebase project: https://firebase.google.com/docs/cli#install-cli-mac-linux

https://firebase.google.com/docs/flutter/setup?platform=web

firebase login

dart pub global activate flutterfire_cli

flutter pub add firebase_core

flutterfire configure --platforms web


firebase init

{
  "projects": {
    "default": "flutter-code-space-app"
  }
}


ensure the firebase project is current:

firebase projects:list

Go to firebase console. https://console.firebase.google.com/

Enable hosting. Just click through. 

Generate google service account json. 

Add to code space secrets.

Reload container. 

echo $GOOGLE_APPLICATION_CREDENTIALS

flutter build web

firebase deploy --only hosting