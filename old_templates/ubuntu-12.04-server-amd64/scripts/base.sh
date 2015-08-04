# Set up sudo
( cat <<'EOP'
%vagrant ALL=NOPASSWD:ALL
EOP
) > /tmp/vagrant
chmod 0440 /tmp/vagrant
mv /tmp/vagrant /etc/sudoers.d/

# Install NFS client
apt-get -y install nfs-common

#Turn off and disable ufw
echo "Stopping ufw..."
service ufw stop
echo "Disabling ufw..."
ufw disable

#Don't do reverse DNS lookups of SSH clients that connect; this usually speeds up SSH by quite a bit:
echo "UseDNS no" >> /etc/ssh/sshd_config
