#!/usr/bin/env bash

sudo docker pull quarkchaindocker/pyquarkchain:mainnet1.1.1
sudo docker run -it --name miner --network host quarkchaindocker/pyquarkchain:mainnet1.1.1 /bin/bash

# Inside of Container
QKC_CONFIG=`pwd`/mainnet/singularity/cluster_config_template.json python3 quarkchain/tools/miner_address.py 0xe4c6831ff54e2ec9762be057cc646ca1902f41ba0006e0a1
python3 quarkchain/tools/external_miner.py --config /mainnet/singularity/cluster_config_template.json --worker 1024 --shard 393217 458753 --host 172.19.0.14
