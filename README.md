# gitops-get-started

Si lo desea puede leer la documentación en [Español](docs/es/README.md).

Project to take the first steps in the GitOps work philosophy using Flux CD.

The project shows how to configure a Kubernetes cluster based on GitOps. The organization of folders and services deployed correspond to a hypothetical cluster used for development or staging environments. This cluster configuration is not ready to be used in production.

To get more out of the repository it is recommended to have basic knowledge about the GitOps work philosophy. You can expand your knowledge on this topic through [this link from the Weaveworks website](https://www.weave.works/technologies/gitops/).

The systems used during the exercise were: [Git](https://git-scm.com/), [Terraform](https://www.terraform.io/), [Docker](https://www.docker.com/), [Flux CD](https://fluxcd.io/) y [Kubernetes](https://kubernetes.io/). The platform used to create the Kubernetes cluster is [Digital Ocean](https://www.digitalocean.com/), but [Minikube](https://minikube.sigs.k8s.io/) can also be used.

Flow to manage the infrastructure

![Infrastructure Overview](diagrams/terraform-digitalocean-kubernetes.svg)

----

Flow to manage the Kubernetes

![Flux Overview](diagrams/flux-overview.svg)

## Folder structure

```bash
├── infra
│   └── cluster.tf
├── namespaces
│   ├── admin
│   │   ├── namespace.yaml
│   │   └── sealed-secrets
│   │       └── sealed-secrets.yaml
│   ├── client-abc
│   │   ├── deployment.yaml
│   │   └── namespace.yaml
│   ├── client-def
│   │   ├── deployment.yaml
│   │   └── namespace.yaml
│   ├── flux-system
│   │   └── namespace.yaml
│   └── kube-system
│       ├── kube-state-metrics
│       │   └── kube-state-metrics.yaml
│       └── metrics-server
│           └── metrics-server.yaml
└── scripts
    └── install.sh
```

| Folder     | Description |
| ---------- | ------      |
| infra      | Terraforms files to create the infrastructure in Digital Ocean. (Optional) |
| namespaces | Structure of namespaces used in the cluster. Within each namespace are the applications that will be deployed. |
| scripts    | General utility folder. |

## Case Study Sections

The following links will guide you in the creation of a Kubernetes cluster using the GitOps work philosophy.

* [Tools needed](docs/en/01-client-tools.md)
* [Setup the repository](docs/en/02-clone-repository.md)
* [Setup Digital Ocean](docs/en/03-setup-digital-ocean.md)
* [Setup Terraform Cloud](docs/en/04-setup-terraform-cloud.md)
* [Create Kubernetes cluster](docs/en/05-create-cluster.md)
* [Install Flux CD](docs/en/06-install-fluxcd.md)
* [Synchronize GitHub <-> Flux CD](docs/en/07-syncronice-github-fluxcd.md)
* [Manage Secrets using Sealed Secrets](docs/en/08-sealed-secrests.md)
* [Cleaning Up](docs/en/09-cleaning-up.md)