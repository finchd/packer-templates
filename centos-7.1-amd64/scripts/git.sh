#!/bin/sh -x
#Install some prerequisites for git from yum so we don't have to hunt them down manually
yum install -y gcc make gcc-c++ zlib-devel perl-ExtUtils-Embed gettext curl-devel zlib-devel openssl-devel cpio expat-devel gettext-devel

cd /tmp
wget https://www.kernel.org/pub/software/scm/git/git-2.7.0.tar.gz
tar zxf git-2.7.0.tar.gz > /dev/null
cd git-2.7.0/
./configure > /dev/null
#Compile it and put it into /usr/local
sudo make prefix=/usr/local all > /dev/null; sudo make prefix=/usr/local install > /dev/null

#remove the source code and tarball so they don't take up space in the final, packaged VM
cd /tmp
rm -rf /tmp/git-2.7.0/ /tmp/git-2.7.0.tar.gz

cp /tmp/gitconfig /home/vagrant/.gitconfig
cp /tmp/gitignore_global /home/vagrant/.gitignore_global

chown -R vagrant:vagrant /home/vagrant/

cp /tmp/gitconfig /root/.gitconfig
cp /tmp/gitignore_global /root/.gitignore_global