#!/usr/bin/env bash

. ../config.sh

set -x 

cat "../templates/dap_policy/root.yml.template" | \
  sed -e "s#{{ K8S_FOLLOWER_NS }}#$K8S_FOLLOWER_NS#g"  | \
  sed -e "s#{{ K8S_FOLLOWER_SVC_ACCT }}#$K8S_FOLLOWER_SVC_ACCT#g"  | \
  sed -e "s#{{ DAP_AUTHN_K8S_BRANCH }}#$DAP_AUTHN_K8S_BRANCH#g" \
  > root.yml

printf "\n==== Review root.yml before moving on to the next step ====\n"
