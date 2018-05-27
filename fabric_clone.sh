#!/bin/bash

mkdir -p $GOPATH/src/github.com/hyperledger
sudo mkdir -p /etc/hyperledger
cp core.yaml /etc/hyperledger

sudo mkdir -p /var/hyperledger
cp core.yaml /var/hyperledger

cd $GOPATH/src/github.com/hyperledger
scp -r -P 42000 kiiren@168.131.42.48:/home/kiiren/repos/build/fabric  $(pwd)
cd fabric
make native
sudo mv -f .build/bin/peer /etc/hyperledger
sudo mv -f .build/bin/orderer /var/hyperledger