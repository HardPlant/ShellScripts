#!/bin/bash

wget https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz

tar -xzf go1.4-bootstrap-20171003.tar.gz

mv go go1.4

cd go1.4/src

CGO_ENABLED=0
./make.bash