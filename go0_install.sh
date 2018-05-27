#!/bin/bash

wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz

tar -C /usr/local -zxf go1.10.2.linux-amd64.tar.gz

export GOROOT=/usr/local/go
mkdir -p $HOME/go/src
export GOPATH=$HOME/go

echo "GOROOT=/usr/local/go\nGOPATH=$HOME/go/src" >> ~/.profile