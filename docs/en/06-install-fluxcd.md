# Install Flux CD

Once the cluster is created, the next step is to install Flux CD. This will be the only occasion that you will need to use the `kubectl` tool to establish the changes in the cluster.

## Install Flux

Use the `scripts/install.sh` file to install the following services in the cluster:

|Tool             |Description|
|-----------------|-----------|
|`flux`           |Tool to automate deployments in Kubernetes. It is based on the GitOps work philosophy.|
|`helm-operator`  |System responsible for managing Helm charts in the `flux` tool.|
|`flux-memcached` |System responsible for keeping track of images and changes in the `flux` tool.|

> Check in the `install.sh` file that the `--set git.url` parameter is set with your directory in GitHub.

```bash
./scripts/install.sh
```

List the services created in the namespace `flux-system` when the script finishes running:

```bash
kubectl get pods -n flux-system

NAME                              READY   STATUS    RESTARTS   AGE
flux-59bb67c8b4-h2kcp             1/1     Running   0          4m3s
flux-memcached-8647794c5f-hhdzc   1/1     Running   0          4m3s
helm-operator-77cb687cc7-wdcfg    1/1     Running   0          3m23s
```

You can check that all services are working correctly.

Next: [Synchronize GitHub <-> Flux CD](07-syncronice-github-fluxcd.md)
