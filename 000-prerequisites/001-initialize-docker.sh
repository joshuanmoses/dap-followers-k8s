#!/usr/bin/env bash

. ../config.sh

set -x
docker pull cyberark/dap-seedfetcher

docker pull cyberark/conjur-cli:5
mkdir -p ../cli5/root

docker load -i ../$CONJUR_APPLIANCE_FILE
