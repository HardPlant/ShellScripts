#!/bin/bash

mkdir -p /var/hyperledger/orderer

#$1 = Peer Name
#$2 = ORG_NAME
#$3 = MSP
#peer0.org1.example.com
ORDERERNAME=$1 # orderer0
ORG=$2 # example.com
MSPID=$3
ORDERER=$1.$2 # orderer0.org1.example.com

ARTIFACT=/tmp/channel-artifacts/genesis.block
ORDERERS_DIR=/tmp/crypto-config/ordererOrganizations/$ORG/orderers/$ORDERER

scp -r -P 42000 kiiren@168.131.42.48:$ARTIFACT /var/hyperledger/orderer
scp -r -P 42000 kiiren@168.131.42.48:$ORDERERS_DIR/msp /var/hyperledger/orderer/tls
scp -r -P 42000 kiiren@168.131.42.48:$ORDERERS_DIR/tls /var/hyperledger/orderer/msp

#../channel-artifacts/genesis.block:/var/hyperledger/orderer/orderer.genesis.block
#../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
#   :/var/hyperledger/orderer/msp
#../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/
#   :/var/hyperledger/orderer/tls

export ORDERER_GENERAL_LOGLEVEL=debug
export ORDERER_GENERAL_LISTENADDRESS=0.0.0.0
export ORDERER_GENERAL_GENESISMETHOD=file
export ORDERER_GENERAL_GENESISFILE=/var/hyperledger/orderer/genesis.block
export ORDERER_GENERAL_LOCALMSPID=OrdererMSP
export ORDERER_GENERAL_LOCALMSPDIR=/var/hyperledger/orderer/msp
      # enabled TLS
export ORDERER_GENERAL_TLS_ENABLED=true
export ORDERER_GENERAL_TLS_PRIVATEKEY=/var/hyperledger/orderer/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE=/var/hyperledger/orderer/tls/server.crt
export ORDERER_GENERAL_TLS_ROOTCAS=[/var/hyperledger/orderer/tls/ca.crt]
export ORDERER_KAFKA_RETRY_SHORTINTERVAL=1s
export ORDERER_KAFKA_RETRY_SHORTTOTAL=30s
export ORDERER_KAFKA_VERBOSE=true