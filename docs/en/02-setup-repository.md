# Setup the repository

This section will indicate the steps to follow to configure the code repository.

## Fork the repository

Make a fork of the repository to your work area in GitHub. This way you can modify the code freely.

![GitHub fork](../../diagrams/github-fork.png)

## Clone the repository

Clone the repository to your computer:

> Change `YOUR-GITHUB-USER` by your user on GitHub.

```bash
git clone git@github.com:YOUR-GITHUB-USER/gitops-get-started.git
```

Access the cloned repository directory:

```bash
cd gitops-get-started
```

## Modify the installation file

Modify the installation file so that it uses your repository as the source of origin:

> Change `YOUR-GITHUB-USER` by your user on GitHub.

```bash
sed  -i "" "s/mmorejon/YOUR-GITHUB-USER/g" scripts/install.sh
```

Commit the changes and send them to your repository on GitHub:

```bash
git add scripts/install.sh
git commit -sm 'Change github repository.'
git push origin master
```

Next: [Setup Digital Ocean](03-setup-digital-ocean.md)
