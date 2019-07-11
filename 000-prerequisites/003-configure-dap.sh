#!/usr/bin/env bash

. ../config.sh

DAP_INTERNAL_IP="172.31.35.124"
DAP_SSH_KEY=~/.ssh/DAPDemo.pem
DAP_HOSTNAME="ec2-100-24-56-192.compute-1.amazonaws.com"
DAP_ACCT="demo"
DAP_USER="admin"
DAP_PASS="Cyberark1"

ssh -i $DAP_SSH_KEY core@$DAP_INTERNAL_IP "docker exec conjur-appliance evoke configure master -h $DAP_HOSTNAME -p $DAP_PASS $DAP_ACCT"
