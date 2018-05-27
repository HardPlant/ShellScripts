#!/bin/bash

mkdir -p $GOPATH/src/github.com/hyperledger
sudo mkdir -p /etc/hyperledger
mv core.yaml /etc/hyperledger

cd $GOPATH/src/github.com/hyperledger
scp -r -P 42000 kiiren@168.131.42.48:/home/kiiren/repos/build/fabric  $(pwd)
cd fabric
make native
sudo mkdir -p /etc/hyperledger
sudo mv -f .build/bin/* /etc/hyperledger