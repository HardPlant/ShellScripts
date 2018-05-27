mkdir -p $GOPATH/src/github.com/hyperledger
cd $GOPATH/src/github.com/hyperledger
scp -r kiiren@192.168.42.48:/home/kiiren/repos/build/fabric -P 42000 ./fabric