#!/usr/bin/env bash

. ../config.sh

kubectl create -f conjur-follower.yml

echo "==== Deployments ===="
kubectl get deployments
echo "==== Pods ===="
kubectl get pods

printf "\n====== Deployment of Followers into Kubernetes Complete ====="
printf "\n============================================================="
printf "\n\nNOTES:"
printf "\n- Using the pod IDs displayed above,"
printf "\n  run `kubectl logs <pod-id> -c authenticator`"
printf "\n  to determine if the authenticator correctly pulled the seed file."
printf "\n============================================================="
