#!/bin/bash -ev

rm -rf ~/testchain

./go-ethereum/build/bin/geth --datadir=~/testchain init genesis.json
