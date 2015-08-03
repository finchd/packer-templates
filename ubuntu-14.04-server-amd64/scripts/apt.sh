#!/bin/sh -x

apt-get -y install --no-install-recommends linux-headers-$(uname -r) build-essential
apt-get -y install --no-install-recommends zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install --no-install-recommends dkms
apt-get -y install --no-install-recommends nfs-common
apt-get -y install --no-install-recommends rake
apt-get -y install --no-install-recommends tmux nano curl vim tree htop smartmontools mosh inotify-tools zerofree software-properties-common ncdu silversearcher-ag unzip ccze pv pigz rlwrap lnav
#Some metrics gathering tools
apt-get -y install --no-install-recommends apachetop atop nmon dstat sysstat goaccess iotop
