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
