#!/bin/bash -ev

sudo apt-get update -qq
sudo apt-get install -qqy sudo
sudo apt-get install -qqy build-essential git python-software-properties software-properties-common
sudo apt-get install -qqy curl wget
wget --quiet --continue https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz
test -e "/usr/local/go" || sudo tar -xf go1.9.4.linux-amd64.tar.gz -C /usr/local
test -e "go-ethereum/" || git clone https://github.com/ethereum/go-ethereum
export PATH="/usr/local/go/bin:${PATH}"
which go && go version
pushd go-ethereum
make all
popd


sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update -qq
sudo apt-get install -qqy solc

solc --overwrite --optimize --bin --abi greeter.sol  -o output
echo "var greeterContract=`solc --optimize --combined-json abi,bin,interface greeter.sol`" > greeter.js
cat greeter.js

echo "var simpleContract=`solc --optimize --combined-json abi,bin,interface simple.sol`" > simple.js
cat simple.js
