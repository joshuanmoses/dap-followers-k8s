#!/usr/bin/env bash

. ../config.sh

echo "==== Logging into AWS ECR Docker Registry..."
$(aws ecr get-login --no-include-email --region us-east-1)

set -x

docker tag $CONJUR_APPLIANCE_IMG $CONJUR_APPLIANCE_REPO
docker push $CONJUR_APPLIANCE_REPO
