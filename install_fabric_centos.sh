#curl -s -L goo.gl/HsERvL | sudo bash -s

#curl
yum -y install curl wget

#Go
GVERSION="1.8.3"
GFILE="go$GVERSION.linux-amd64.tar.gz"

GOROOT="/usr/local/go"
GOPATH="/usr/local/go"
wget --no-verbose https://storage.googleapis.com/golang/$GFILE -O /tmp/$GFILE

tar -C "/usr/local" -xzf /tmp/$GFILE

cp -f "$HOME/.bashrc" "$HOME/.bashrc.bkp"

touch "$HOME/.bashrc"
{
    echo ''
    echo '# GOLANG'
    echo 'export GOROOT='$GOROOT
    echo 'export GOPATH='$GOPATH
    echo 'export GOBIN=$GOPATH/bin'
    echo 'export PATH=$PATH:$GOROOT/bin:$GOBIN'
    echo ''
} >> "$HOME/.bashrc"
source "$HOME/.bashrc"
echo "GOROOT set to $GOROOT"

rm -f /tmp/$GFILE

# docker

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
service docker start
curl -sSL https://goo.gl/6wtTN5 | bash -s 1.1.0
