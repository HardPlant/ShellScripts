scp -r kiiren@192.168.30.155:/tmp/crypto-config/ordererOrganizations/example.com/msp/tlscacerts /etc/hyperledger/orderercert
CHANNEL_NAME=mychannel
CORE_PEER_TLS_ENABLED=true
ORDERER_CA=/etc/hyperledger/orderercert/tlsca.example.com-cert.pem

./peer channel join -b $CHANNEL_NAME.block