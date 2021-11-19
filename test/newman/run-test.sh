#!/bin/bash

namespace=$1

oc get route -n ${namespace} create-customer-details-rest-https -ojson | jq -r .spec.host
newman run test.json --env-var "username=aceuser" -k --env-var "password=passw0rd" --env-var "host=$(oc get route -n ${namespace} create-customer-details-rest-https -ojson | jq -r .spec.host)"