#!/bin/bash

if [ $1 -neq "no-download"]; then
    wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
fi

tar -C /usr/local -zxf go1.10.2.linux-amd64.tar.gz

export GOROOT=/usr/local/go
mkdir -p $HOME/go/src
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin

echo "GOROOT=/usr/local/go" >> ~/.profile
echo "GOPATH=$HOME/go/src" >> ~/.profile
echo "PATH=$PATH:$GOROOT/bin" >> ~/.profile