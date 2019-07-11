#!/usr/bin/env bash

. ../config.sh

# Download seed fetcher from github
git clone https://github.com/cyberark/kubernetes-conjur-deploy.git

# Build seed-fetcher
pushd kubernetes-conjur-deploy/build/seed-fetcher
CONJUR_NAMESPACE_NAME=latest ./build.sh
popd

docker pull cyberark/conjur-cli:5
mkdir -p ../cli5/root

docker load -i ../$CONJUR_APPLIANCE_FILE
