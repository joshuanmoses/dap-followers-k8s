#!/usr/bin/env bash

. ../config.sh

ssh -i $DAP_SSH_KEY core@$DAP_INTERNAL_IP "docker exec conjur-appliance chpst -u conjur conjur-plugin-service possum rake authn_k8s:ca_init[""conjur/authn-k8s/$DAP_AUTHN_K8S_BRANCH""]"
