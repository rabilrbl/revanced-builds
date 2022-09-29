#!/bin/bash

# install the necessary dependencies
sudo apt-get -q update
sudo apt-get -yq install gnupg curl jq wget tree

# Azul Zulu OpenJDK setup
export ZULU_REPO_VER=1.0.0-3
sudo apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl tzdata && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu-repo_${ZULU_REPO_VER}_all.deb && sudo dpkg -i zulu-repo_${ZULU_REPO_VER}_all.deb && \
    sudo apt-get -qq update && \
    sudo mkdir -p /usr/share/man/man1 && \
    sudo echo "Package: zulu17-*\nPin: version 17.0.4.1-*\nPin-Priority: 1001" > /etc/apt/preferences && \
    sudo apt-get -qq -y --no-install-recommends install zulu17-jdk=17.0.4.1-* && \
    sudo apt-get -qq -y purge gnupg software-properties-common curl && \
    sudo apt -y autoremove && \
    sudo rm -rf /var/lib/apt/lists/* zulu-repo_${ZULU_REPO_VER}_all.deb

# export JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/zulu17-ca-amd64

# should print zulu jdk version
java -version