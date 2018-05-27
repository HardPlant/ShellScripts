#!/bin/bash

HOST=192.168.30.155

mkdir -p $GOPATH/src/github.com/hyperledger
sudo mkdir -p /etc/hyperledger
cp core.yaml /etc/hyperledger
cp 0.set_peer.sh /etc/hyperledger

sudo mkdir -p /var/hyperledger
cp core.yaml /var/hyperledger
cp 2.set_orderer.sh /etc/hyperledger

cd $GOPATH/src/github.com/hyperledger
scp -r -P 42000 kiiren@$HOST:/home/kiiren/repos/build/fabric  $(pwd)
cd fabric
make native
sudo mv -f .build/bin/peer /etc/hyperledger
sudo mv -f .build/bin/orderer /var/hyperledger