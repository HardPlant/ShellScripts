#!/bin/bash

mkdir -p /etc/hyperledger/adminmsp

scp kiiren@192.168.30.155:/tmp/e2e_cli/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp /etc/hyperledger/adminmsp

