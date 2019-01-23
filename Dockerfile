FROM norionomura/swiftlint:latest
LABEL maintainer "Michael Berg <michael.berg.dd@googlemail.com>"

RUN swiftlint version

# Install danger.js
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g danger
RUN danger --version

# Install danger-swift
RUN git clone https://github.com/danger/danger-swift.git && \
cd danger-swift && \
make install
RUN danger-swift --help

 # Run danger
CMD ["danger-swift", "ci"]
