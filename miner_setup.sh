#!/bin/bash

docker exec -it miner python3 quarkchain/tools/external_miner.py --config mainnet/singularity/cluster_config_template.json --worker 1 --shard 393217 458753 --host 172.19.0.15:38391

sudo docker run -it --network host --name qkc_cluster -v ~/snapshots/data:/code/pyquarkchain/quarkchain/cluster/qkc-data/mainnet -it -p 38291:38291 -p 38391:38391 -p 38491:38491 -p 38291:38291/udp quarkchaindocker/pyquarkchain:mainnet-index1.1.1 /bin/bash

sudo docker exec -it miner python3 /code/pyquarkchain/quarkchain/tools/state -i 2 --ip 172.19.0.15:38391

sudo docker exec -it miner python3 /code/pyquarkchain/quarkchain/tools/miner_address.py 0xe4c6831ff54e2ec9762be057cc646ca1902f41ba0001e0a1
