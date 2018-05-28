#!/bin/bash

PEERNAME=$1 # peer0
ORG=$2 # org1.example.com
MSPID=$3
PEER=$1.$2 # peer0.org1.example.com

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ];then
    echo "usage: . $0 PEERNAME ORG MSPID"
    echo "example: . $0 peer0 org1.example.com Org1MSP"
fi

export CORE_LOGGING_LEVEL=DEBUG
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_GOSSIP_USELEADERELECTION=true
export CORE_PEER_GOSSIP_ORGLEADER=false
export CORE_PEER_PROFILE_ENABLED=true
export CORE_PEER_TLS_CERT_FILE=/etc/hyperledger/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/etc/hyperledger/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/etc/hyperledger/tls/ca.crt

export CORE_PEER_ID=$PEER
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_CHAINCODEADDRESS=localhost:7052
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=localhost:7051
export CORE_PEER_LOCALMSPID=$MSPID
export CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/admintls