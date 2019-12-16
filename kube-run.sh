#!/usr/bin/env bash

CONTAINER="expnch/ops-net-tools"

function kube-run {
    local context
    context=$(kubectl config view -o json | jq -r '.["current-context"]')

    local namespace
    namespace=$(kubectl config view -o json | jq -r --arg context "$context" '.contexts[] | select(.name==$context) | .context.namespace')

    local pod_id
    pod_id="testbox-$(cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | tr '[:upper:]' '[:lower:]')"

    kubectl run --generator=run-pod/v1 -n $namespace --image=$CONTAINER $pod_id
    status=$(kubectl get pods -n $namespace -l run=$pod_id -o json | jq -r .'items'[0].'status'.'phase')
    while [ $status != "Running" ]; do
        echo "Waiting for pod to start (currently $status)..."
        status=$(kubectl get pods -n $namespace -l run=$pod_id -o json | jq -r .'items'[0].'status'.'phase')
        sleep 2
    done
    kubectl exec -it -n $namespace $pod_id /bin/bash
    kubectl delete pod -n $namespace $pod_id
}
