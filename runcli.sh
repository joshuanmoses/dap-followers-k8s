#!/usr/bin/env bash

docker run --name cli5 \
  -v $PWD/cli5/root:/root \
  --rm \
  -it \
  cyberark/conjur-cli:5
