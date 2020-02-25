# Instalar Flux CD

Una vez creado el cluster el próximo paso es instalar Flux CD. Esta será la única ocasión que necesitará utilizar la herramienta `kubectl` para establecer los cambios en el cluster.

## Instalar Flux

Utilice el fichero `scripts/install.sh` para instalar los siguientes servicios en el cluster:

| Herramienta      | Descripción                                                                                                |
| ---------------- | ---------------------------------------------------------------------------------------------------------- |
| `flux`           | Herramienta para automatizar los despliegues en Kubernetes. Está basada en la filosofía de trabajo GitOps. |
| `helm-operator`  | Sistema encargado de gestionar los charts de Helm en la herramienta `flux`.                                |
| `flux-memcached` | Sistema encargado de llevar el registro de imágenes y cambios en la herramienta `flux`.                    |

> Compruebe en el fichero `install.sh` que el parámetro `--set git.url` esté configurado con su directorio en GitHub.

```bash
./scripts/install.sh
```

Liste los servicios creados en el namespace `flux-system` cuando termine de ejecutarse el script:

```bash
kubectl get pods -n flux-system

NAME                              READY   STATUS    RESTARTS   AGE
flux-59bb67c8b4-h2kcp             1/1     Running   0          4m3s
flux-memcached-8647794c5f-hhdzc   1/1     Running   0          4m3s
helm-operator-77cb687cc7-wdcfg    1/1     Running   0          3m23s
```

Podrá comprobar que los tres servicios están funcionando correctamente.

Siguiente: [Sincronizar GitHub <-> Flux CD](07-syncronice-github-fluxcd.md)
