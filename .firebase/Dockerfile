FROM node:slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python \
    && rm -rf /var/lib/apt/lists/*

ENV GOOGLE_APPLICATION_CREDENTIALS ./google-application-credentials.json

RUN npm install -g firebase-tools