# fiber-ops

> This is a tool to automate the management of AWS EC2 and other resources, and deployment of fiber nodes, using a server ubuntu 22.04 targeting 300 nodes.

## Install and configure aws cli
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version  
aws configure
# Enter AWS Access Key, Secret Key, default zone (e.g. `us-east-1`)
```

## Install Terraform
```
TERRAFORM_VERSION="1.12.2" 
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform version 
```

## Install Ansible
```
sudo apt update
sudo apt install -y ansible
ansible --version
```

## Create server resources
```
git clone https://github.com/jiangxianliang007/fiber-ops.git
cd fiber-ops/terraform
terraform init
terraform apply
```

The inventory.ini will be automatically generated for the required servers according to the specified requirements.

## Batch Generation of Wallets

Generate 300 wallets via https://app.ckbccc.com/, copy wallets to fiber-ops/ckb-wallets/wallets.txt # Format: wallet address, private key

```
cd fiber-ops/ckb-wallets
python3 generate_wallets_json.py # Generate wallets.json 
Format:
[
  {
    "id": "1",
    "address": "ckt1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsq0fwpshaxlvm3lxx",
    "privkey": "70816acd3535ca4fce123a3f32e9db1174d16d44cxxxx"
  },
  {
    "id": "2",
    "address": "ckt1qzda0cr08m85hc8jlnfp3zer7xulejywt49kt2rr0vthywaa50xwsqww5yaelvm72vrxxx",
    "privkey": "5c4f42c111d75d8f234348ff524c661a273bd5af021xxxx"
  }
]
python3 cutt_wallet.py  # Cutting wallets by node type facilitates recharging a specified number of ckb and UDTs
```

## Generate hosts.ini and Prometheus Watchlist

```
cd fiber-ops
python3 generate_hosts_ini.py  # get terraform/inventory.ini Generate ansible/inventory/hosts.ini
python3 generate_prometheus_host_list.py # Generate Prometheus-formatted host lists
```

## deployments fiber
```
cd fiber-ops/ansible
ansible-playbook deploy_fiber.yml --tags full_deploy  # Deploy all nodes
ansible-playbook deploy_fiber.yml -l "fiber-test-FRA-node-1-1" --tags full_deploy  # Deploy a single node

tags list:
full_deploy # full deploy node 
binary_update # update binary 
config_update # update config file
status
stop 
start
cleanup  # Cleanup nodes

ansible-playbook -i ../terraform/inventory.ini deploy_node_exporter.yml  -e "target_groups=Edge"  # Deploying a non-fiber task requires specifying inventory.ini because, by default, inventory/hosts.ini servers are used to deploy multiple nodes, but non-fiber only needs to be deployed 1 time.
```

## Check if deployed check nodes are alive
```
cd fiber-ops/ansible/inventory
python3 generate_rpc_list.py  # Generate rpc 
python3 node_active_check.py  # Call rpc to check node health status

Checking 20 nodes from core.txt...
Checking 40 nodes from secondary.txt...
Checking 240 nodes from edge.txt...

Check completed: 300/300 nodes online
Results saved to node_status.json
```
