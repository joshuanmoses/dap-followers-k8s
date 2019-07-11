#!/usr/bin/env bash

. ../config.sh

set -x 

ssh -i $DAP_SSH_KEY core@$DAP_INTERNAL_IP "docker exec conjur-appliance bash -c 'echo CONJUR_AUTHENTICATORS=""authn,authn-k8s/$DAP_AUTHN_K8S_BRANCH"" >> /opt/conjur/etc/conjur.conf && sv restart conjur'"

sleep 5

echo "==== Enabled DAP Authenticators ===="
curl -sk https://$DAP_HOSTNAME/info | jq '.authenticators.enabled'
