#!/bin/bash

#Debian 7.7
cd ./debian-7.7-amd64
packer build --only=virtualbox-iso debian-7.7-amd64.json

#CentOS 6.5
cd ../centos-6.5-amd64
packer build --only=virtualbox-iso centos-6.5-amd64.json

#CentOS 7.0
cd ../centos-7.0-amd64
packer build --only=virtualbox-iso centos-7.0-amd64.json

#Ubuntu 12.04: this template is for an older version of Ubuntu, but 12.04 is a still-supported LTS release
#so we still want to have fresh builds of it
cd ../ubuntu-12.04-server-amd64
packer build --only=virtualbox-iso ubuntu-12.04-server-amd64.json

#Ubuntu 14.04
cd ../ubuntu-14.04-server-amd64
packer build --only=virtualbox-iso ubuntu-14.04-server-amd64.json
