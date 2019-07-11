#!/usr/bin/env bash

. ../config.sh

$(aws ecr get-login --no-include-email --region us-east-1)

docker tag seed-fetcher:latest $SEED_FETCHER_REPO
docker push $SEED_FETCHER_REPO

docker tag $CONJUR_APPLIANCE_IMG $CONJUR_APPLIANCE_REPO
docker push $CONJUR_APPLIANCE_REPO
