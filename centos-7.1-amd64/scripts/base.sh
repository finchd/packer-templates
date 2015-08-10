# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

#Stop and disable iptables
systemctl stop iptables
systemctl disable iptables
#Flush all of iptable's rules:
iptables -F

#Stop and disable firewalld
systemctl stop firewalld
systemctl disable firewalld

#Don't do reverse DNS lookups of SSH clients that connect; this usually speeds up SSH by quite a bit:
echo "UseDNS no" >> /etc/ssh/sshd_config