#!/bin/sh -x

##############################
# ZSH installation
##############################

#ZSH needs autoconf to compile:
yum -y install autoconf

cd /tmp
wget https://github.com/zsh-users/zsh/archive/zsh-5.2.tar.gz
tar zxf zsh-5.2.tar.gz
cd zsh-zsh-5.2
#Generate the configure script first...
./Util/preconfig
#...then run it:
./configure --with-tcsetpgrp
sudo make
sudo make install

#Remove the tarball and tarball extract so they don't take up space in the final, packaged VM
rm -rf /tmp/zsh-5.2/ /tmp/zsh-5.2.tar.gz

##############################
# Vagrant ZSH setup stuff
##############################

#Add this variable so keyboard stuff isn't wonky
echo "DEBIAN_PREVENT_KEYBOARD_CHANGES=yes" > /home/vagrant/.zshenv

#install oh-my-zsh first
cd /home/vagrant
#su - vagrant -c 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'
su - vagrant -c 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; cd ~/.oh-my-zsh; git checkout ca648ae7b1ca7cf2abbc63afde3c216994a71966'

#Make a folder for plugins like...
mkdir -p /home/vagrant/.oh-my-zsh/custom/plugins
cd /home/vagrant/.oh-my-zsh/custom/plugins
#smarter history search
/usr/local/bin/git clone git://github.com/zsh-users/zsh-history-substring-search.git
#syntax highlighting
/usr/local/bin/git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#cat the uploaded vagrant .zshrc into the /home/vagrant/.zshrc file
cat /tmp/vagrant-zshrc > /home/vagrant/.zshrc

#Copy the .zsh_history file so we have some frequently used commands available for use
#as soon as VMs are booted from the base box:
cat /tmp/vagrant_zsh_history > /home/vagrant/.zsh_history

chown -R vagrant:vagrant /home/vagrant/
#cat in the uploaded ZSH theme
cat /tmp/vagrant-zsh-theme.zsh-theme > /home/vagrant/.oh-my-zsh/themes/vagrant-zsh-theme.zsh-theme

#Install rbenv and some plugins
/usr/local/bin/git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
mkdir -p /home/vagrant/.rbenv/plugins
cd /home/vagrant/.rbenv/plugins; 
/usr/local/bin/git clone git://github.com/sstephenson/ruby-build.git

#Set ownership of the homedir incase any commands above set parts of it to root 
chown -R vagrant:vagrant /home/vagrant/.rbenv/

##############################
# root ZSH setup stuff
##############################

#Add this variable so keyboard stuff isn't wonky
echo "DEBIAN_PREVENT_KEYBOARD_CHANGES=yes" > /root/.zshenv

#install oh-my-zsh first
cd /root
#su - root -c 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'
su - root -c 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; cd ~/.oh-my-zsh; git checkout ca648ae7b1ca7cf2abbc63afde3c216994a71966'

#Make a folder for plugins like...
mkdir -p /root/.oh-my-zsh/custom/plugins
cd /root/.oh-my-zsh/custom/plugins
#smarter history search
/usr/local/bin/git clone git://github.com/zsh-users/zsh-history-substring-search.git
#syntax highlighting
/usr/local/bin/git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#cat the uploaded vagrant .zshrc into the /home/vagrant/.zshrc file
cat /tmp/root-zshrc > /root/.zshrc

#cat in the uploaded ZSH theme
cat /tmp/root-zsh-theme.zsh-theme > /root/.oh-my-zsh/themes/root-zsh-theme.zsh-theme

#Copy the .zsh_history file so we have some frequently used commands available for use
#as soon as VMs are booted from the base box:
cat /tmp/root_zsh_history > /root/.zsh_history

#Install rbenv and some plugins
/usr/local/bin/git clone git://github.com/sstephenson/rbenv.git /root/.rbenv
mkdir -p /root/.rbenv/plugins
cd /root/.rbenv/plugins
/usr/local/bin/git clone git://github.com/sstephenson/ruby-build.git

#Change the login shell to zsh for the vagrant and root users
echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh vagrant
chsh -s /usr/local/bin/zsh root