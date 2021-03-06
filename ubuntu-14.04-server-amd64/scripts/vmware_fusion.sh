#!/bin/bash

#Source: https://github.com/chef/bento/blob/master/scripts/common/vmtools.sh

mkdir /tmp/vmfusion
mkdir /tmp/vmfusion-archive
mount -o loop /home/vagrant/linux.iso /tmp/vmfusion
tar xzf /tmp/vmfusion/VMwareTools-*.tar.gz -C /tmp/vmfusion-archive
/tmp/vmfusion-archive/vmware-tools-distrib/vmware-install.pl --default
umount /tmp/vmfusion
rm -rf  /tmp/vmfusion
rm -rf  /tmp/vmfusion-archive
rm /home/vagrant/*.iso
