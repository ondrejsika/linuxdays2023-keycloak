# linuxdays2023-keycloak

## Install ArgoCD

```
slu scripts kubernetes install-argocd --domain argocd.linuxdays.sikademo.com
```

## Install Keycloak

```
kubectl apply -f keycloak.yml
```

## Configure Keycloak using Terraform

```
cd terraform-keycloak
terraform init
terraform apply
```

## Configure SSO in ArgoCD

```
kubectl apply -f argocd-config.yml
```

```
kubectl rollout restart -n argocd deployment argocd-server
```

## Install Gitlab

```
apt-get update
apt-get install -y curl locales-all
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
```

```
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates perl postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.linuxdays.sikademo.com" apt-get install gitlab-ee
```
