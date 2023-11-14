FROM google/dart:2

RUN apt-get update -qq && apt-get install -qqy --no-install-recommends \
    curl=7.* \
    jq=1.* \
    bash \
    git=1:2.* \
    unzip=6.* \
    xz-utils=5.* \
    && rm -rf /var/lib/apt/lists/*

ENV PATH ${PATH}:/opt/flutter/bin
RUN git clone --branch stable https://github.com/flutter/flutter.git /opt/flutter \
    && flutter --help