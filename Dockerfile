FROM norionomura/swiftlint:latest
LABEL maintainer "Michael Berg <michael.berg.dd@googlemail.com>"

# Install danger.js
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g danger@6.1.13
RUN danger --version

# Install danger-swift
RUN git clone -b '1.1.0' https://github.com/danger/danger-swift.git && \
cd danger-swift && \
make install && \
cd ..
RUN danger-swift --help

# Setup SHELL env variable
ENV SHELL /bin/bash

 # Run danger
CMD ["danger-swift", "ci"]
