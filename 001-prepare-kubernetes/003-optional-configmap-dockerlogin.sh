#!/usr/bin/env bash

. ../config.sh

aws ecr get-login --no-include-email --region $AWS_REGION > ecr-login.txt

DOCKER_REGISTRY_USER=$(cat ecr-login.txt | cut -f4 -d' ')
DOCKER_REGISTRY_PASS=$(cat ecr-login.txt | cut -f6 -d' ')
DOCKER_REGISTRY_URL=$(cat ecr-login.txt | cut -f7 -d' ')

kubectl create secret docker-registry dockerpullsecret \
           --docker-server=$DOCKER_REGISTRY_URL \
           --docker-username=$DOCKER_REGISTRY_USER \
           --docker-password=$DOCKER_REGISTRY_PASS
