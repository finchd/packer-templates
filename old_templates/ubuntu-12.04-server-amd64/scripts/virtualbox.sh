# Without libdbus virtualbox would not start automatically after compile
apt-get -y install libdbus-1-3

# The netboot installs the VirtualBox support (old) so we have to remove it
/etc/init.d/virtualbox-ose-guest-utils stop
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
aptitude -y install dkms

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

#Create a symlink to the VirtualBox guest additions manually as a workaround for: https://www.virtualbox.org/ticket/12879
ln -s /opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

#Remove the guest additions ISO so it doesn't take up space in the finished base box:
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso