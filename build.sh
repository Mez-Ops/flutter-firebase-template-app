#!/bin/bash
docker buildx create --name mybuilder --use --bootstrap

docker buildx build --push \
--platform linux/amd64,linux/arm64 \
--tag mezops/flutter-firebase-image:latest .