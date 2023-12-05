# mezops_flutter_app

A Mez Ops Flutter App

## Features

### Out of the box:
- [x] Flutter
- [x] Firebase
    - User is authenticated via best practices for firebase
        - Must use ENV=GOOGLE_APPLICATION_CREDENTIALS to authenticate with firebase
        - GOOGLE_APPLICATION_CREDENTIALS = location to credentials.json
        - credentials.json loaded from local env and file system 
            - if no GOOGLE_APPLICATION_CREDENTIALS, alert user
        - running `firebase deploy` should work out of the box. 
- [x] Firebase Emulator Suite
    - Emulators start when container starts
        - running `flutter run` will use the emulators by default.
    - [x] Firestore
    - [x] TBD

### TODO:

- /firebase.json: fill out the appropriate values for the project
- /.devcontainer/Dockerfile: create docker file so that running the devcontainer.json will implement the features above
- /.devcontainer/devcontainer.json: do not touch, unless absolutely necessary


## Chat GPT reference:
`/.devcontainer/devcontainer.json`: 
    - https://containers.dev/implementors/json_reference/
`/.devcontainer/Dockerfile`:
    - https://github.com/nodejs/docker-node (the base image docs)
    - https://docs.docker.com/engine/reference/builder/ (Dockerfile reference docs) 
    - https://firebase.google.com/docs/cli/#install-cli-mac-linux (installing firebase cli on linux)
    - https://firebase.google.com/docs/flutter/setup?platform=web (firebase setup for flutter web)
    - https://firebase.google.com/docs/flutter/setup?platform=android (firebase setup for flutter android)
    - https://firebase.google.com/docs/flutter/setup?platform=ios (firebase setup for flutter ios)
    - https://firebase.google.com/docs/projects/dev-workflows/overview-environments (firebase environments)
    - https://firebase.google.com/docs/cli/#initialize_a_firebase_project (best practices for firebase)
    - https://firebase.google.com/docs/emulator-suite (firebase emulator suite)
    - https://firebase.google.com/docs/emulator-suite/connect_and_prototype (firebase emulator suite connect and prototype)
    - https://firebase.google.com/docs/emulator-suite/connect_firestore (firebase emulator suite connect firestore)
    - https://firebase.google.com/docs/emulator-suite/install_and_configure (firebase emulator suite install and configure)
`firebase.json`:
    - https://firebase.google.com/docs/cli/#the_firebasejson_file
