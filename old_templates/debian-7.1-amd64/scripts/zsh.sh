#!/bin/sh -x

##############################
# ZSH installation
##############################
cd /tmp
wget https://github.com/zsh-users/zsh/archive/zsh-5.2.tar.gz
tar zxf zsh-5.2.tar.gz
cd zsh-zsh-5.2
./configure
sudo make
sudo make install

#Change the login shell to zsh for the vagrant and root users
chsh -s `which zsh` vagrant
chsh -s `which zsh` root

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
git clone git://github.com/zsh-users/zsh-history-substring-search.git
#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#cat the uploaded vagrant .zshrc into the /home/vagrant/.zshrc file
cat /tmp/vagrant-zshrc > /home/vagrant/.zshrc

chown -R vagrant:vagrant /home/vagrant/

#cat in the uploaded ZSH theme
cat /tmp/vagrant-zsh-theme.zsh-theme > /home/vagrant/.oh-my-zsh/themes/vagrant-zsh-theme.zsh-theme

##############################
# root ZSH setup stuff
##############################

#Add this variable so keyboard stuff isn't wonky
su - root -c 'echo "DEBIAN_PREVENT_KEYBOARD_CHANGES=yes" > /root/.zshenv'

#install oh-my-zsh first
su - root -c 'cd /root/; curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh'
#Make a folder for plugins like...
su - root -c 'mkdir -p /root/.oh-my-zsh/custom/plugins
su - root -c 'cd /root/.oh-my-zsh/custom/plugins
#smarter history search
su - root -c 'cd /root/.oh-my-zsh/custom/plugins; git clone git://github.com/zsh-users/zsh-history-substring-search.git'
#syntax highlighting
su - root -c 'cd /root/.oh-my-zsh/custom/plugins; git clone git://github.com/zsh-users/zsh-syntax-highlighting.git'

#cat the uploaded vagrant .zshrc into the /home/vagrant/.zshrc file
cat /tmp/root-zshrc > /root/.zshrc

#cat in the uploaded ZSH theme
su - root -c 'cat /tmp/root-zsh-theme.zsh-theme > /root/.oh-my-zsh/themes/root-zsh-theme.zsh-theme'

#Install rbenv and some plugins
su - root -c 'git clone git://github.com/sstephenson/rbenv.git /root/.rbenv'
su - root -c 'mkdir -p /root/.rbenv/plugins'
su - root -c 'cd /root/.rbenv/plugins; git clone git://github.com/sstephenson/ruby-build.git'