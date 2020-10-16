FROM ubuntu:18.04

USER root
SHELL ["/bin/bash", "-c"]

# ubuntu setup
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update
RUN apt-get -y install git && \
    apt-get -y install locales && \
    apt-get -y install curl && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

###########################################################################
#                                                                         #
#  theos setup at https://github.com/theos/theos/wiki/Installation-Linux  #
#                                                                         #
###########################################################################

# Install the following prerequisites
RUN apt-get -y install fakeroot perl clang-6.0 build-essential

# Set up the THEOS environment variable
ENV THEOS /theos

# Clone Theos to your device
RUN git clone --recursive https://github.com/theos/theos.git ${THEOS}

# Get the toolchain
RUN curl https://kabiroberai.com/toolchain/download.php?toolchain=ios-linux -Lo toolchain.tar.gz && \
    tar xzf toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm toolchain.tar.gz

# Get an iOS SDK
RUN rm -r ${THEOS}/sdks && \
    git clone --recursive https://github.com/theos/sdks.git ${THEOS}/sdks

# Install the Swift toolchain
RUN curl https://kabiroberai.com/toolchain/download.php?toolchain=swift-ubuntu-latest -Lo swift-toolchain.tar.gz && \
    tar xzf swift-toolchain.tar.gz -C ${THEOS}/toolchain && \
    rm swift-toolchain.tar.gz
