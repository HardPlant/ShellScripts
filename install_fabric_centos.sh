#curl -s -L https://raw.githubusercontent.com/HardPlant/ShellScripts/master/install_fabric_centos.sh | sudo bash
set -e

#curl
yum -y install curl

#Go
GVERSION="1.8.3"
GFILE="go$GVERSION.linux-amd64.tar.gz"

GOROOT="/usr/local/go"
wget --no-verbose https://storage.googleapis.com/golang/$GFILE -O /tmp

tar -C "/usr/local" -xzf /tmp

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

curl -sSL https://goo.gl/6wtTN5 | bash -s 1.1.0
