#!/bin/bash

#Debian 7.8
cd ./debian-7.8-amd64
packer build --only=virtualbox-iso debian-7.8-amd64.json

#CentOS 6.5
cd ../centos-6.6-amd64
packer build --only=virtualbox-iso centos-6.6-amd64.json

#CentOS 7.1
cd ../centos-7.1-amd64
packer build --only=virtualbox-iso centos-7.1-amd64.json

#CentOS 7.1
cd ../centos-7.1-amd64
packer build --only=virtualbox-iso centos-7.1-amd64.json

#Ubuntu 14.04
cd ../ubuntu-14.04-server-amd64
packer build --only=virtualbox-iso ubuntu-14.04-server-amd64.json

