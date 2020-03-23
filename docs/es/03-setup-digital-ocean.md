# Configurar Digital Ocean

Digital Ocean es la plataforma seleccionada para crear el cluster de Kubernetes. Si es la primera vez que escucha hablar de esta plataforma no se preocupe, porque todos sus servicios pueden ser accedidos de forma fácil y sencilla.

## Crear usuario en Digital Ocean

Si no tienes usuario en la plataforma Digital Ocean puedes utilizar [este enlace para crearse una cuenta con $100 de crédito al iniciar](https://m.do.co/c/fb2c605da7ee). El costo del ejercicio realizado en este laboratorio es de $20 al mes (**$0.030 la hora**).

## Crear token personal

El token de acceso personal será utilizado para gestionar los componentes de la plataforma a través del cliente `doctl`.

* Acceda a la [sección API](https://cloud.digitalocean.com/account/api/tokens) y genere un token nuevo con permisos de lectura y escritura.
* Copie y guarde de forma segura el código generado para utilizarlo en las próximas secciones.

Al crear el token debe obtener un resultado similar al mostrado en la siguiente imagen.

![Digital Ocean Token](../../diagrams/do-token.png)

## Instalar doctl

`doctl` es el cliente de Digital Ocean. A través de este sistema podrá acceder a todos los recursos de la plataforma desde el Terminal.

Utilice el siguiente enlace para instalar `doctl`: <https://github.com/digitalocean/doctl#installing-doctl>

La versión a instalar debe ser igual o mayor a la `1.38.0`.

```bash
doctl version

doctl version 1.38.0-release
```

## Configurar doctl

Utilice el comando `auth init` para autenticar el cliente `doctl` con la plataforma. Utilice el token generado en la sección anterior como parámetro de entrada.

```bash
doctl auth init

DigitalOcean access token:
Validating token... OK
```

Compruebe que existe una buena comunicación entre el cliente `doctl` y la plataforma. Liste las versiones de Kubernetes que tiene disponible la plataforma utilizando el siguiente comando:

```bash
doctl kubernetes options versions

Slug            Kubernetes Version
1.16.6-do.2     1.16.6
1.15.9-do.2     1.15.9
1.14.10-do.2    1.14.10
```

Siguiente: [Configurar Terraform Cloud](04-setup-terraform.md)
