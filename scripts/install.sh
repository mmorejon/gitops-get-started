#!/usr/bin/env bash

# create namespace
kubectl create ns flux-system

# install flux
helm upgrade -i flux fluxcd/flux --wait \
--namespace flux-system \
--version=1.2.0 \
--set git.url=git@github.com:mmorejon/gitops-get-started \
--set git.branch=master \
--set git.path=namespaces \
--set git.pollInterval=5m \
--set manifestGeneration=false \
--set registry.excludeImage="index.docker.io/*\,quay.io/*\,gcr.io/*" \
--set syncGarbageCollection.enabled=true \
--set syncGarbageCollection.dry=true

# install flux-helm-operator
helm upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace flux-system \
--version=0.7.0 \
--set createCRD=false \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3