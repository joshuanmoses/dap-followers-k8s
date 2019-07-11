#!/usr/bin/env bash

. ../config.sh

VALUE_FILE=../k8s_values.json

api_key=$(curl -sk --user $DAP_USER:$DAP_PASS https://$DAP_HOSTNAME/authn/$DAP_ACCT/login)
auth_result=$(curl -sk https://$DAP_HOSTNAME/authn/$DAP_ACCT/$DAP_USER/authenticate -d "$api_key")

DAP_TOKEN=$(echo -n $auth_result | base64 | tr -d '\r\n')
DAP_AUTH_HEADER="Authorization: Token token=\"$DAP_TOKEN\""

POST_URL="https://$DAP_HOSTNAME/policies/$DAP_ACCT/policy/root"
curl -sk -H "$DAP_AUTH_HEADER" -d "$(< ./root.yml)" $POST_URL

POST_URL="https://$DAP_HOSTNAME/secrets/$DAP_ACCT/variable/conjur/authn-k8s/$DAP_AUTHN_K8S_BRANCH/kubernetes/service-account-token"
SVC_ACCT_TOKEN=$(cat $VALUE_FILE | jq -r .svc_token | base64 -d)
curl -sk -H "$DAP_AUTH_HEADER" --data "$SVC_ACCT_TOKEN" $POST_URL

POST_URL="https://$DAP_HOSTNAME/secrets/$DAP_ACCT/variable/conjur/authn-k8s/$DAP_AUTHN_K8S_BRANCH/kubernetes/ca-cert"
CA_CERT=$(cat $VALUE_FILE | jq -r .ca_cert | base64 -d)
curl -sk -H "$DAP_AUTH_HEADER" --data "$CA_CERT" $POST_URL

POST_URL="https://$DAP_HOSTNAME/secrets/$DAP_ACCT/variable/conjur/authn-k8s/$DAP_AUTHN_K8S_BRANCH/kubernetes/api-url"
API_URL=$(cat $VALUE_FILE | jq -r .api_url)
curl -sk -H "$DAP_AUTH_HEADER" --data "$API_URL" $POST_URL
