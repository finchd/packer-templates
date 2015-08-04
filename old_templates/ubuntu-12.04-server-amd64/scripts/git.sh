#!/bin/sh -x
#Install some prerequisites for git from apt so we don't have to hunt them down manually
apt-get -y install build-essential gettext libcurl4-gnutls-dev libexpat1-dev

cd /tmp
wget https://www.kernel.org/pub/software/scm/git/git-2.5.0.tar.gz
tar zxf git-2.5.0.tar.gz
cd git-2.5.0/
./configure
#Compile it and put it into /usr/local
make prefix=/usr/local all; make prefix=/usr/local install

#remove the source code and tarball so they don't take up space in the final, packaged VM
cd /tmp
rm -rf /tmp/git-2.5.0/ /tmp/git-2.5.0.tar.gz

cp /tmp/gitconfig /home/vagrant/.gitconfig
cp /tmp/gitignore_global /home/vagrant/.gitignore_global

chown -R vagrant:vagrant /home/vagrant/

cp /tmp/gitconfig /root/.gitconfig
cp /tmp/gitignore_global /root/.gitignore_global