FROM norionomura/swiftlint:0.32.0_swift-4.2
LABEL maintainer "Michael Berg <michael.berg.dd@googlemail.com>"

# Install danger.js
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    npm install -g danger@7.1.3 && \
    danger --version

# Install danger-swift
RUN git clone --branch 1.5.4 --depth 1 https://github.com/danger/danger-swift.git && \
    make -C danger-swift install && \
    rm -r danger-swift
RUN danger-swift --help

# Setup SHELL env variable
ENV SHELL /bin/bash

 # Run danger
CMD ["danger-swift", "ci"]
