#!/usr/bin/env bash

# create namespace
kubectl apply -f namespaces/flux-system/namespace.yaml

# install flux
helm upgrade flux fluxcd/flux --wait \
--install \
--namespace flux-system \
--version=1.2.0 \
--set git.url=git@github.com:mmorejon/gitops-get-started \
--set git.branch=master \
--set git.path=namespaces \
--set git.pollInterval=5m \
--set sync.interval=2m \
--set manifestGeneration=false \
--set registry.automationInterval=2m \
--set registry.excludeImage="quay.io/*\,gcr.io/*" \
--set syncGarbageCollection.enabled=true \
--set syncGarbageCollection.dry=true \
--set memcached.hostnameOverride=flux-memcached.flux-system

# install flux-helm-operator
helm upgrade helm-operator fluxcd/helm-operator --wait \
--install \
--namespace flux-system \
--version=0.7.0 \
--set createCRD=false \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3