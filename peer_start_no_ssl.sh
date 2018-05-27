CORE_LOGGING_LEVEL=debug
CORE_CHAINCODE_LOGGING_LEVEL=DEBUG
CORE_PEER_ID=peer0.org1.example.com
CORE_PEER_ADDRESS=localhost:7051
CORE_PEER_LOCALMSPID=Org1MSP
CORE_PEER_MSPCONFIGPATH=$(pwd)/msp
#./crypto-config/peerOrganizations/org1.example.com/peers/
#   peer0.org1.example.com/msp
#   :/etc/hyperledger/peer/msp
#./crypto-config/peerOrganizations/org1.example.com/users
#   :/etc/hyperledger/msp/users

peer node start