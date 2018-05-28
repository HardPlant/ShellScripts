#!/bin/bash

#/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
scp -r kiiren@192.168.30.155:/tmp/crypto-config/ordererOrganizations/example.com/msp/tlscacerts /etc/hyperledger/orderercert
CHANNEL_NAME=mychannel
CORE_PEER_TLS_ENABLED=true
ORDERER_CA=/etc/hyperledger/orderercert/tlsca.example.com-cert.pem
./peer channel create -o orderer.example.com:7050 \
-c $CHANNEL_NAME \
-f ./channel-artifacts/channel.tx \
--tls $CORE_PEER_TLS_ENABLED \
--cafile $ORDERER_CA