#!/usr/bin/env bash

. ../config.sh

set -x

sed -e "s#{{ K8S_FOLLOWER_NS }}#$K8S_FOLLOWER_NS#g" "../templates/manifests/conjur-role.yml.template" | \
sed -e "s#{{ K8S_FOLLOWER_SVC_ACCT }}#$K8S_FOLLOWER_SVC_ACCT#g"  | \
sed -e "s#{{ K8S_FOLLOWER_APP_LABEL }}#$K8S_FOLLOWER_APP_LABEL#g" \
> conjur-role.yml 

kubectl create -f ./conjur-role.yml

kubectl config set-context $(kubectl config current-context) --namespace=$K8S_FOLLOWER_NS

echo -n | openssl s_client \
    -showcerts \
    -connect $DAP_HOSTNAME:443 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    > ./conjur-cert.pem

kubectl create configmap server-certificate \
    --from-file=ssl-certificate=./conjur-cert.pem

