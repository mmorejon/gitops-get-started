# Synchronize GitHub <-> Flux CD

In order for Flux to obtain the information stored in the GitHub repository, it is necessary to enable read permissions.

## Get ssh key

Flux generates an ssh key when starting the system. To obtain this key use the following command:

```bash
fluxctl identity --k8s-fwd-ns flux-system

ssh-rsa AAAAB.......
```

## Register key in GitHub

Access the *Deploy keys* section within the repository created in GitHub. You can use the following link to achieve this:

> Change `YOUR-GITHUB-USER` by your user on GitHub.

<https://github.com/YOUR-GITHUB-USER/gitops-get-started/settings/keys/new>

Add the ssh public key generated in the previous step.

> Also enable write permissions if you want Flux to make changes to the repository.

![Terraform Apply](../../diagrams/github-deploy-keys.png)

## Synchronize Flux with the repository

Flux synchronizes existing changes in the repository automatically based on the time set in the `git.pollInterval` parameter. By default the value is `5m`, but if you do not want to wait this time you can use the following command:

```bash
fluxctl sync --k8s-fwd-ns flux-system
```

This command line tells the flux system to synchronize the state of the cluster objects with the existing elements in the git repository.

### Logs in Flux

Access the flux system logs and verify that you have successfully accessed GitHub.

```bash
kubectl -n flux-system logs -l app=flux
```

### Synchronized folders

Once synchronization between Flux CD and GitHub is achieved, you can see that all the existing elements in the `namespaces` folder have been created in the cluster.

```bash
kubectl get namespaces

NAME              STATUS   AGE
admin             Active   17m
client-abc        Active   17m
client-def        Active   17m
default           Active   107m
flux-system       Active   60m
kube-node-lease   Active   107m
kube-public       Active   107m
kube-system       Active   107m
```

List the existing Pods in these namespaces and you will notice the correspondence with the services described in the GitHub repository.

```bash
kubectl get pods -n client-abc && kubectl get pods -n client-def

NAME                       READY   STATUS    RESTARTS   AGE
app-abc-6b6c9d5599-kbddb   1/1     Running   0          24m
app-abc-6b6c9d5599-ltql7   1/1     Running   0          24m
NAME                       READY   STATUS    RESTARTS   AGE
app-def-5bd5d956c5-d64r7   1/1     Running   0          24m
app-def-5bd5d956c5-md5vz   1/1     Running   0          24m
app-def-5bd5d956c5-vdjx2   1/1     Running   0          24m
```

## Workflow using GitOps

At this time you can manage your cluster through the GitOps work philosophy.

All changes established in the cluster must be in the Git repository and it will be Flux CD who has the responsability for keeping the state of the objects in Kubernetes synchronized.

![Terraform Apply](../../diagrams/flux-overview.svg)

I suggest you that from this moment modify the existing components and evaluate how they react. It is important that you understand that the existing structure in this repository corresponds to an example case, you should identify which repository structure best corresponds to your business.

Next: [Manage Secrets using Sealed Secrets](08-sealed-secrests.md)
