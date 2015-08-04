#!/bin/bash

#Go into the old_templates folder first; every other command will get run relative to this folder
cd old_templates/

#Debian 7.1
cd ./debian-7.1-amd64
packer build --only=virtualbox template.json

#Debian 7.2
cd ../debian-7.2-amd64
packer build --only=virtualbox template.json

#Debian 7.3
cd ../debian-7.3-amd64
packer build --only=virtualbox template.json

#Debian 7.4
cd ../debian-7.4-amd64
packer build --only=virtualbox-iso template.json

#Debian 7.5
cd ../debian-7.5-amd64
packer build --only=virtualbox-iso template.json

#Debian 7.6
cd ../debian-7.6-amd64
packer build --only=virtualbox-iso template.json

#Debian 7.7
cd ../debian-7.7-amd64
packer build --only=virtualbox-iso debian-7.7-amd64.json

#CentOS 6.4
cd ../centos-6.4-amd64
packer build --only=virtualbox template.json

#CentOS 6.5
cd ../centos-6.5-amd64
packer build --only=virtualbox centos-6.5-amd64.json

#CentOS 7.0
cd ../centos-7.0-amd64
packer build --only=virtualbox centos-7.0-amd64.json

#Ubuntu 12.04: this template is for an older version of Ubuntu, but 12.04 is a still-supported LTS release
#so we still want to have fresh builds of it
cd ../ubuntu-12.04-server-amd64
packer build --only=virtualbox-iso ubuntu-12.04-server-amd64.json

#Ubuntu 12.10
cd ../ubuntu-12.10-server-amd64
packer build --only=virtualbox template.json

#Ubuntu 13.04
cd ../ubuntu-13.04-server-amd64
packer build --only=virtualbox template.json

#Ubuntu 13.10
cd ../ubuntu-13.10-server-amd64
packer build --only=virtualbox-iso template.json

#Ubuntu 14.10
cd ../ubuntu-14.10-server-amd64
packer build --only=virtualbox-iso ubuntu-14.10-server-amd64.json

