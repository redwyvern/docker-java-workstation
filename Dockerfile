FROM docker.artifactory.weedon.org.au/redwyvern/java-devenv-base
MAINTAINER Nick Weedon <nick@weedon.org.au>

ARG DEBIAN_FRONTEND=noninteractive

# Pre-install some utilities needed to install the rest of the software
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    sudo \
    vim \
    strace \
    net-tools \
    iputils-ping \
    telnet \
    dnsutils \
    iproute2 \
    git \
    file \
    xauth \
    x11-apps \
    libxtst6 \
    libxi6 \
    man \
    less \
    wireshark \
    && apt-get -q autoremove \
    && apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

VOLUME /home

USER root

RUN useradd -m developer -G sudo -s /bin/bash \
    && sed -i 's/%sudo[[:space:]]*ALL=(ALL:ALL)[[:space:]]*ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers

RUN echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


