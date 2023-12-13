#!/bin/bash

docker build --push \
--platform linux/arm64 \
--tag mezops/flutter-firebase-image:latest .