# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

#disable iptables
chkconfig iptables off
service iptables stop
iptables -F

#Don't do reverse DNS lookups of SSH clients that connect; this usually speeds up SSH by quite a bit:
echo "UseDNS no" >> /etc/ssh/sshd_config