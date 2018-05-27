#!/bin/bash

mkdir -p $GOPATH/src/github.com/hyperledger
cd $GOPATH/src/github.com/hyperledger
scp -r -P 42000 kiiren@168.131.42.48:/home/kiiren/repos/build/fabric  $(pwd)
cd fabric
make native