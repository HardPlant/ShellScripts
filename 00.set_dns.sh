sudo apt-get update
sudo apt-get install bind9 bind9utils bind9-doc

sudo cp -f ./dns/named.conf.local /etc/bind/named.conf.local
sudo mkdir /etc/bind/zones
sudo cp -f ./dns/db* /etc/bind/zones