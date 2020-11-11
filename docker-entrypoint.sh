#!/bin/bash

set -e

KEYFILE_PATH=/tmp/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1).json

echo "$GCP_KEYFILE" | base64 -d > $KEYFILE_PATH

gcloud auth activate-service-account --key-file=$KEYFILE_PATH
gcloud container clusters get-credentials $GCP_CLUSTER --project $GCP_PROJECT_ID --zone $GCP_ZONE

kubectl config set-context --current --namespace=$GCP_NAMESPACE

rm $KEYFILE_PATH

exec "$@"