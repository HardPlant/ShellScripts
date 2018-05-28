#!/bin/bash
CHANNEL_NAME=mychannel
CORE_PEER_TLS_ENABLED=true
ORDERER_CA=/etc/hyperledger/orderercert/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID=$1

./peer channel update -o orderer.example.com:7050 \
-c $CHANNEL_NAME \
-f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx 
--tls $CORE_PEER_TLS_ENABLED 
--cafile $ORDERER_CA
