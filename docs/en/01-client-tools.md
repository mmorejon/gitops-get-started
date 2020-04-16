# Tools needed

In this section you will know the command line tools that you will need throughout the exercise.

## Kubectl

`kubectl` is the tool that will allow you to interact with the Kubernetes cluster.

It is necessary to have `kubectl` installed in a version equal to or greater than `v1.16.3`.

Use the following link to access the installation instructions: <https://kubernetes.io/docs/tasks/tools/install-kubectl/>

```bash
kubectl version --client

Client Version: version.Info{Major:"1", Minor:"16", GitVersion:"v1.16.3", GitCommit:"b3cbbae08ec52a7fc73d334838e18d17e8512749", GitTreeState
:"clean", BuildDate:"2019-11-14T04:24:29Z", GoVersion:"go1.12.13", Compiler:"gc", Platform:"darwin/amd64"}
```

## Helm 3

`helm` is the tool that will allow you to package and manage Kubernetes applications.

It is necessary to have `helm` installed in a version equal to or greater than `v3.1.1`.

Use the following link to access the installation instructions: <https://helm.sh/docs/intro/install/>

```bash
helm version

version.BuildInfo{Version:"v3.1.1", GitCommit:"afe70585407b420d0097d07b21c47dc511525ac8", GitTreeState:"clean", GoVersion:"go1.13.8"}
```

Add FluxCD repository to Helm repos:

```bash
helm repo add fluxcd https://charts.fluxcd.io
```

Update Helm repositories

```bash
helm repo update

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "fluxcd" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈ Happy Helming!⎈
```

## Flux CD

`fluxctl` is the tool that will allow you to access the Flux CD service installed in the Kubernetes cluster.

It is necessary to have `fluxctl` installed in a version equal to or greater than `1.19.0`.

Use the following link to access the installation instructions: <https://docs.fluxcd.io/en/1.18.0/references/fluxctl.html#installing-fluxctl>

```bash
fluxctl version

1.19.0
```

Next: [Setup the repository](02-setup-repository.md)
