# Herramientas necesarias

En esta sección conocerá las herramientas de líneas de comandos que va a necesitar a lo largo del ejercicio.

## Kubectl

`kubectl` es la herramienta que le permitirá interactuar con el cluster de Kubernetes.

Es necesario tener instalado `kubectl` en una versión igual o superior a la `v1.16.3`.

Utilice el siguiente enlace para acceder a las instrucciones de la instalación: <https://kubernetes.io/docs/tasks/tools/install-kubectl/>

```bash
kubectl version --client

Client Version: version.Info{Major:"1", Minor:"16", GitVersion:"v1.16.3", GitCommit:"b3cbbae08ec52a7fc73d334838e18d17e8512749", GitTreeState
:"clean", BuildDate:"2019-11-14T04:24:29Z", GoVersion:"go1.12.13", Compiler:"gc", Platform:"darwin/amd64"}
```

## Helm 3

`helm` es la herramienta que le permitirá empaquetar y gestionar las aplicaciones de Kubernetes.

Es necesario tener instalado `helm` en una versión igual o superior a la `v3.1.1`.

Utilice el siguiente enlace para acceder a las instrucciones de la instalación: <https://helm.sh/docs/intro/install/>

```bash
helm version

version.BuildInfo{Version:"v3.1.1", GitCommit:"afe70585407b420d0097d07b21c47dc511525ac8", GitTreeState:"clean", GoVersion:"go1.13.8"}
```

Agrege el repositorio de Flux CD a los repositorios de Helm

```bash
helm repo add fluxcd https://charts.fluxcd.io
```

Actualice los repositorios

```bash
helm repo update

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "fluxcd" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈ Happy Helming!⎈
```

## Flux CD

`fluxctl` es la herramienta que le permitirá acceder al servicio Flux CD instalado en el cluster de Kubernetes.

Es necesario tener instalado `fluxctl` en una versión igual o superior a la `1.19.0`.

Utilice el siguiente enlace para acceder a las instrucciones de la instalación: <https://docs.fluxcd.io/en/1.18.0/references/fluxctl.html#installing-fluxctl>

```bash
fluxctl version

1.19.0
```

Siguiente: [Configurar el repositorio](02-setup-repository.md)
