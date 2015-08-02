###################################################
# Allow pings. Originally from:
# http://support.microsoft.com/kb/947709
################################################### 

netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol=icmpv4 dir=in action=allow