#!/bin/sh

# Get the toolchain
curl https://kabiroberai.com/toolchain/download.php?toolchain=ios-linux -Lo toolchain.tar.gz && \
    tar xzf toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm toolchain.tar.gz

# Get an iOS SDK
rm -r ${THEOS}/sdks && \
    git clone --recursive https://github.com/theos/sdks.git ${THEOS}/sdks

# Install the Swift toolchain
curl https://kabiroberai.com/toolchain/download.php?toolchain=swift-ubuntu-latest -Lo swift-toolchain.tar.gz && \
    tar xzf swift-toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm swift-toolchain.tar.gz
