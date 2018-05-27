#!/bin/bash

#$1 = Peer Name
#$2 = ORG_NAME
#$3 = MSP
#peer0.org1.example.com
PEERNAME=$1 # peer0
ORG=$2 # org1.example.com
MSPID=$3
PEER=$1.$2 # peer0.org1.example.com

PEERS_DIR=/tmp/crypto-config/peerOrganizations/$ORG/peers/$PEER
#/crypto-config/peerOrganizations/
#   org1.example.com/peers/peer0.org1.example.com/msp:/etc/hyperledger/fabric/msp
scp -r -P 42000 kiiren@168.131.42.48:$PEERS_DIR/msp /etc/hyperledger/fabric/tls
scp -r -P 42000 kiiren@168.131.42.48:$PEERS_DIR/tls /etc/hyperledger/fabric/msp

export CORE_LOGGING_LEVEL=DEBUG
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_GOSSIP_USELEADERELECTION=true
export CORE_PEER_GOSSIP_ORGLEADER=false
export CORE_PEER_PROFILE_ENABLED=true
export CORE_PEER_TLS_CERT_FILE=/etc/hyperledger/fabric/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=/etc/hyperledger/fabric/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=/etc/hyperledger/fabric/tls/ca.crt

export CORE_PEER_ID=$PEER
export CORE_PEER_ADDRESS=0.0.0.0:7051
export CORE_PEER_CHAINCODEADDRESS=0.0.0.0:7052
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=0.0.0.0:7051
export CORE_PEER_LOCALMSPID=$MSPID

./peer node start