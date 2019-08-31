#!/usr/bin/env bash
echo Update .deb
sudo apt update
sudo apt-get install libgflags-dev
sudo apt-get install libsnappy-dev
sudo apt-get install zlib1g-dev
sudo apt-get install libbz2-dev
sudo apt-get install liblz4-dev
sudo apt-get install libzstd-dev

git clone https://github.com/facebook/rocksdb.git
cd rocksdb

sudo make shared_lib

export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:`pwd`/include
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:`pwd`
export LIBRARY_PATH=${LIBRARY_PATH}:`pwd`

cd ..
sudo chown ubuntu:ubuntu rocksdb -Rf
cd rocksdb

sudo cp librocksdb.so /usr/local/lib
sudo mkdir -p /usr/local/include/rocksdb/
sudo cp -r ./include/* /usr/local/include/
