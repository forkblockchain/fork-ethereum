#!/bin/bash -ev

rm -rf forkethereum.tar.gz
git archive --format=tar.gz -o forkethereum.tar.gz --prefix=/forkethereum/ HEAD .

