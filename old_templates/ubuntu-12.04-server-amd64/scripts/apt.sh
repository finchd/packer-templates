#!/bin/sh -x

#Clean out apt and re-update it so we have the most recent package and repo lists:
apt-get -y clean
apt-get -y autoclean
apt-get -y remove
apt-get -y autoremove
apt-get -y update

apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install dkms
apt-get -y install nfs-common
apt-get -y install rake
apt-get -y install tmux nano curl vim tree htop smartmontools mosh inotify-tools zerofree software-properties-common ncdu unzip pv

#Some metrics gathering tools
apt-get -y install apachetop atop nmon dstat sysstat goaccess iotop

#Install ag
cd /tmp
wget http://swiftsignal.com/packages/ubuntu/precise/the-silver-searcher_0.14-1_amd64.deb
dpkg -i the-silver-searcher_0.14-1_amd64.deb