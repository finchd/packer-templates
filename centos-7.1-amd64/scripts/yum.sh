#Yum and RPM package installations

#Install EPEL 7:
yum -y install epel-release

#Install the CentOS Software Collections repo. More info available here:
# https://access.redhat.com/site/documentation/en-US/Red_Hat_Software_Collections/1/html-single/1.0_Release_Notes/index.html
#We'll install this later when they have a version ready for CentOS 7:

#yum install centos-release-SCL

#Clean yum and then update it to get new package lists from EPEL:
yum clean all
yum -y check-update

yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils pcre-devel pcre net-tools bzip2

#more packages
yum -y install man nc vim nano tmux htop tree lsof curl wget screen telnet mailx unzip yum-utils ccze rsync ncdu mosh pv rlwrap

#Packages that can't be installed:

# ccze - missing libpcre.so.0()(64bit)

#Some metrics gathering tools
yum -y install apachetop dstat sysstat iotop smartmontools

#Ag installation: https://github.com/ggreer/the_silver_searcher

yum -y install the_silver_searcher