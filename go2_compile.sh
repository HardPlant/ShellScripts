#!/bin/bash
if [ $1 -neq "no-download" ]; then
    wget https://dl.google.com/go/go1.10.2.src.tar.gz
fi

cd go/src
./all.bash