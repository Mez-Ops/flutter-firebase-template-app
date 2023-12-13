FROM node:alpine

RUN apk add openjdk11

RUN npm install -g firebase-tools

COPY firebase.json /app/firebase.json
COPY firestore.rules /app/firestore.rules
COPY firestore.indexes.json /app/firestore.indexes.json
COPY .firebaserc /app/.firebaserc

WORKDIR /app

CMD [ "firebase", "--project=flutter-firebase-template-app", "emulators:start", "--only", "firestore" ]