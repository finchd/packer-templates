#!/bin/bash

HOME_DIR="${HOME_DIR:-/home/vagrant}";

mkdir -p /tmp/vmfusion;
mkdir -p /tmp/vmfusion-archive;
mount -o loop $HOME_DIR/linux.iso /tmp/vmfusion;
tar xzf /tmp/vmfusion/VMwareTools-*.tar.gz -C /tmp/vmfusion-archive;
/tmp/vmfusion-archive/vmware-tools-distrib/vmware-install.pl --default;
umount /tmp/vmfusion;
rm -rf  /tmp/vmfusion;
rm -rf  /tmp/vmfusion-archive;
rm -f $HOME_DIR/*.iso;