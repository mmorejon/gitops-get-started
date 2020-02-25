# Configurar el repositorio

En esta sección se indicarán los pasos a seguir para configurar el repositorio de código.

## Crear una bifurcación del repositorio

Realice una bifurcación del repositorio hacia su área de trabajo en GitHub. De esta forma podrá modificar el código libremente.

![GitHub fork](../../diagrams/github-fork.png)

## Clonar el repositorio

Clone el repositorio hacia su ordenador:

> Cambie `YOUR-GITHUB-USER` por su usuario en GitHub.

```bash
git clone git@github.com:YOUR-GITHUB-USER/gitops-get-started.git
```

Acceda al directorio del repositorio clonado:

```bash
cd gitops-get-started
```

## Modificar el fichero de instalación

Modifique el fichero de instalación para que utilice su repositorio como fuente de origen:

> Cambie `YOUR-GITHUB-USER` por su usuario en GitHub.

```bash
sed  -i "" "s/mmorejon/YOUR-GITHUB-USER/g" scripts/install.sh
```

Establezca los cambios y envíelos a su repositorio en GitHub:

```bash
git add scripts/install.sh
git commit -sm 'Change github repository.'
git push origin master
```

Siguiente: [Configurar Digital Ocean](03-setup-digital-ocean.md)
