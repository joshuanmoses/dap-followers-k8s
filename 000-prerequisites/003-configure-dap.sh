#!/usr/bin/env bash

. ../config.sh

ssh -i $DAP_SSH_KEY core@$DAP_INTERNAL_IP "docker exec conjur-appliance evoke configure master -h $DAP_HOSTNAME -p $DAP_PASS $DAP_ACCT"
