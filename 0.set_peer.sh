#!/bin/bash

#$1 = Peer Name
#$2 = ORG_NAME
#$3 = MSP
#peer0.org1.example.com
PEERNAME=$1 # peer0
ORG=$2 # org1.example.com
MSPID=$3
PEER=$1.$2 # peer0.org1.example.com

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ];then
    echo "usage: ./$0 PEERNAME ORG MSPID"
    echo "example: ./$0 peer0 org1.example.com Org1MSP"
    exit
fi
HOST=192.168.30.155 #168.131.42.48
PORT=22

PEERS_DIR=/tmp/crypto-config/peerOrganizations/$ORG/peers/$PEER
echo "PEERS_DIR : $PEERS_DIR"
#/crypto-config/peerOrganizations/
#   org1.example.com/peers/peer0.org1.example.com/msp:/etc/hyperledger/fabric/msp

if [ ! -d "/etc/hyperledger/msp" ]; then
    mkdir -p /etc/hyperledger/msp
    echo "GET $PEERS_DIR/msp"
    scp -r -P $PORT kiiren@$HOST:$PEERS_DIR/msp /etc/hyperledger
    echo "$(ls /etc/hyperledger/msp)"
fi
if [ ! -d "/etc/hyperledger/tls" ]; then
    mkdir -p /etc/hyperledger/tls
    echo "GET $PEERS_DIR/tls"
    scp -r -P $PORT kiiren@$HOST:$PEERS_DIR/tls /etc/hyperledger
    echo "$(ls /etc/hyperledger/tls)"
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
export CORE_PEER_ADDRESS=0.0.0.0:7051
export CORE_PEER_CHAINCODEADDRESS=0.0.0.0:7052
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=0.0.0.0:7051
export CORE_PEER_LOCALMSPID=$MSPID
export CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp
echo "PEER NODE START"
./peer node start
