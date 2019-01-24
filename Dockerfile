FROM swift:4.2.1
LABEL maintainer "Michael Berg <michael.berg.dd@googlemail.com>"

# Install danger.js
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g danger@6.1.13
RUN danger --version

# Install danger-swift
RUN git clone https://github.com/danger/danger-swift.git && \
cd danger-swift && \
make install && \
cd ..
RUN danger-swift --help

# Install swiftlint
RUN git clone https://github.com/realm/SwiftLint.git && \
cd SwiftLint && \
git submodule update --init --recursive && \
make install && \
cd ..
RUN swiftlint version

 # Run danger
CMD ["danger-swift", "ci"]
