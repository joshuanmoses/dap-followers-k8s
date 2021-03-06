#!/usr/bin/env bash

. ../config.sh

set -x 

cat "../templates/manifests/conjur-follower.yml.template" | \
sed -e "s#{{ K8S_FOLLOWER_REPLICA_COUNT }}#$K8S_FOLLOWER_REPLICA_COUNT#g" | \
sed -e "s#{{ K8S_FOLLOWER_APP_LABEL }}#$K8S_FOLLOWER_APP_LABEL#g" | \
sed -e "s#{{ K8S_FOLLOWER_SVC_ACCT }}#$K8S_FOLLOWER_SVC_ACCT#g" | \
sed -e "s#{{ SEED_FETCHER_REPO }}#$SEED_FETCHER_REPO#g" | \
sed -e "s#{{ DAP_HOSTNAME }}#$DAP_HOSTNAME#g" | \
sed -e "s#{{ DAP_ACCT }}#$DAP_ACCT#g" | \
sed -e "s#{{ DAP_AUTHN_K8S_BRANCH }}#$DAP_AUTHN_K8S_BRANCH#g" | \
sed -e "s#{{ K8S_FOLLOWER_LOGIN }}#$K8S_FOLLOWER_LOGIN#g" | \
sed -e "s#{{ CONJUR_APPLIANCE_REPO }}#$CONJUR_APPLIANCE_REPO#g" \
> conjur-follower.yml

printf "\n==== Review conjur-follower.yml before moving on to the next step ====\n"
