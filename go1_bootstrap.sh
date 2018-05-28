#!/bin/bash

wget https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz

tar -C $HOME/go1.4 -xzf go1.4-bootstrap-20171003.tar.gz

cd $HOME/go1.4/src

CGO_ENABLED=0
./make.bash