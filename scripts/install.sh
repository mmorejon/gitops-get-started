#!/usr/bin/env bash

# create namespace
kubectl create ns flux-system

# install flux
helm upgrade -i flux fluxcd/flux --wait \
--namespace flux-system \
--set git.url=git@github.com:mmorejon/gitops-get-started \
--set git-branch=master \
--set git-path=namespaces \
--set git-poll-interval=5m \
--set sync-interval=5m \
--set manifest-generation=true \
--set memcached-hostname=flux-memcached.flux-system \
--set memcached-service=flux-memcached.flux-system

# install flux-helm-operator
helm upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace flux-system \
--set createCRD=true \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3