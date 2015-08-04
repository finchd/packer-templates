#!/bin/bash

#CentOS 7.1
cd ../centos-7.1-amd64
packer build --only=vmware-iso centos-7.1-amd64.json
