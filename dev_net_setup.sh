#!/usr/bin/env bash

docker pull quarkchaindocker/pyquarkchain:mainnet1.1.2-alpha
docker run -it --name cluster -p 38291:38291 -p 38391:38391 -p 38491:38491 -p 38291:38291/udp quarkchaindocker/pyquarkchain:mainnet1.1.2-alpha

QKC_CONFIG=`pwd`/devnet/singularity/cluster_config.json python3 quarkchain/tools/miner_address.py 0xCA9F1C9cbAB22b42C53070774D18f6380802D582
python3 quarkchain/cluster/cluster.py --cluster_config /code/pyquarkchain/devnet/singularity/cluster_config.json 
