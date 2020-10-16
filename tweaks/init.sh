#!/bin/bash

cd
# Get the toolchain
curl https://kabiroberai.com/toolchain/download.php?toolchain=ios-linux -Lo toolchain.tar.gz && \
    tar xzf toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm toolchain.tar.gz

# Get an iOS SDK
cd ${THEOS}/sdks/ && \
    git init && \
    git remote add origin https://github.com/theos/sdks.git && \
    git pull origin master

cd
# Install the Swift toolchain
curl https://kabiroberai.com/toolchain/download.php?toolchain=swift-ubuntu-latest -Lo swift-toolchain.tar.gz && \
    tar xzf swift-toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm swift-toolchain.tar.gz
