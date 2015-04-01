#!/bin/sh -x

#Install Ruby, Ruby gems and rake
yum -y install ruby rubygems
gem install rake

#Install Janus for the 'vagrant' user (cd to vagrant's homedir first so we're in the right spot for the script to run)
echo "Installing Vim Janus for the 'vagrant' user..."
su - vagrant -c 'cd /home/vagrant; curl -Lo- https://raw.githubusercontent.com/carlhuda/janus/master/bootstrap.sh | bash | bash'

chown -R vagrant:vagrant /home/vagrant/

#Install Janus for the 'root' user (cd to root's homedir first so we're in the right spot for the script to run)
echo "Installing Vim Janus for the 'root' user..."
su - root -c 'cd /root; curl -Lo- https://raw.githubusercontent.com/carlhuda/janus/master/bootstrap.sh | bash | bash'

#Remove the janus git repo history to save sapce. We want the current checkout of the files but not the whole repo history
echo "Removing git repo histories for Janus to save space..."
rm -rf /home/vagrant/.vim/.git
rm -rf /root/.vim/.git