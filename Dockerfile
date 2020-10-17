FROM ubuntu:18.04

USER root
SHELL ["/bin/bash", "-c"]

# ubuntu setup
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update
RUN apt-get -y install git && \
    apt-get -y install vim && \
    apt-get -y install curl && \
    apt-get -y install tree && \
    apt-get -y install locales && \
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

# Copy THEOS config files
COPY ./theos/CydiaSubstrate.tbd ${THEOS}/vendor/lib/CydiaSubstrate.framework/
COPY ./theos/.nicrc /root/
