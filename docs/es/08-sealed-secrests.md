# Gestionar Secrets utilizando Sealed Secrets

Hasta el momento se ha establecido que todos los componentes deben ser registrados en el repositorio de código como única fuente confiable para establecer los cambios, pero ¿qué pasa con los objetos Secrets?

Los Secrets no pueden ser gestionados de igual forma. Antes de ser adicionados al control de versiones es importante proteger la información que llevan dentro. Para lograr este objetivo se ha desplegado en el cluster el servicio [Sealed Secrets desarrollado por Bitnami](https://github.com/bitnami-labs/sealed-secrets).

```bash
kubectl -n admin get pods

NAME                              READY   STATUS    RESTARTS   AGE
sealed-secrets-769745f6db-4cmkb   1/1     Running   0          59m
```

Los siguientes pasos le ayudarán a crear un Secret en Kubernetes manteniendo el flujo de trabajo GitOps.

## Instalar el cliente kubeseal

`kubeseal` es la herramienta que le permitirá encriptar la información del Secret antes de almacenarlo en el controlador de versiones.

Es necesario tener instalado `kubeseal` en una versión igual o superior a la `v0.11.0`.

Utilice el siguiente enlace para acceder a las instrucciones de la instalación: <https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.11.0>

```bash
kubeseal --version \
--controller-namespace=admin \
--controller-name=sealed-secrets

kubeseal version: v0.11.0
```

## Obtener llave pública

Al iniciar este servicio se genera la llave pública y privada que serán utilizadas durante los procesos de encriptación.

Utilice la siguiente línea de comando para obtener la llave pública:

```bash
kubeseal --fetch-cert \
--controller-namespace=admin \
--controller-name=sealed-secrets \
> pub-cert.pem
```

Genere un Secret de Kubernetes utilizando `kubectl`:

```bash
kubectl -n client-def create secret generic magic-text \
--from-literal incantation=kubernetes \
--dry-run \
-o json > magic-text.json
```

Encripte el Secret utilizando `kubeseal`:

```bash
kubeseal --format=yaml --cert=pub-cert.pem < magic-text.json > magic-text.yaml
```

Compruebe que el fichero `magic-text.yaml` contenga la información encriptada y adiciónelo al repositorio de GitHub.

```bash
mv magic-text.yaml namespaces/client-def
git add namespaces/client-def/magic-text.yaml
git commit -sm 'Add magic text secret'
git push origin master
```

Utilice `fluxctl` para sincronizar el repositorio con el cluster:

```bash
fluxctl sync --k8s-fwd-ns flux-system
```

Ahora liste los Secrets presentes en el namespace `client-def`:

```bash
kubectl -n client-def get secrets
```

Compruebe que el valor del texto almacenado en el Secret es correcto:

```bash
kubectl -n client-def get secrets magic-text -o jsonpath='{.data.incantation}' | base64 --decode
```

Siguiente: [Limpiar](09-cleaning-up.md)
