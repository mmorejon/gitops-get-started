# Configurar Terraform Cloud

La plataforma Terraform Cloud utiliza la Infraestructura como Código para gestionar y proveer cualquier entorno en la nube, infraestructura o servicio.

## Crear usuario en Terraform Cloud

Si no tiene usuario en esta plataforma utilice [este siguiente enlace para crearse uno nuevo](https://app.terraform.io/signup/account?utm_source=docs_banner) en el plan gratis.

## Crear nueva organización

Configure una nueva organización para gestionar el proyecto. Puede utilizar [este enlace](https://app.terraform.io/app/organizations/new) para acceder a las organizaciones en Terraform.

![Terraform Organization](../../diagrams/terraform-organization.png)

Luego enlace su área de trabajo en Terraform Cloud con su repositorio en GitHub.

![Terraform GitHub](../../diagrams/terraform-github.png)

Liste las opciones avanzadas para especificar la carpeta `infra` como la fuente de ficheros terraform dentro de todo el directorio.

![Terraform Advance Options](../../diagrams/terraform-advance-options.png)

## Crear variables de entorno

Configure las variables en Terraform Cloud para conectar esta plataforma con Digital Ocean.

Adicione la variable de entorno `DIGITALOCEAN_TOKEN` junto con el token de Digital Ocean obtenido en la sección anterior.

> No olvide marcar la casilla `Sensitive` para ocultar el valor del token.

![Terraform Environment Values](../../diagrams/terraform-envs.png)

Siguiente: [Crear cluster de Kubernetes](05-create-cluster.md)
