# linuxdays2023-keycloak

Slides:
  - PDF - https://raw.githubusercontent.com/ondrejsika/slides/master/2023-10-08_LinuxDays/LinuxDays_2023__Keycloak__Open_Source_Single_Sign_On_pro_kazdeho__2023-10-08.pdf
  - Google Slides - https://docs.google.com/presentation/d/1NtWtPCT7FvaivztOQzvuue8UfmBA6wdSq-7NwYPIK7c/edit

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

## Configure SSO in Gitlab

```
gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_allow_single_sign_on'] = ['oauth2_generic']
gitlab_rails['omniauth_providers'] = [
  {
    name: "oauth2_generic",
    label: "Keycloak SSO",
    app_id: "gitlab",
    app_secret: "gitlab_secret",
    args: {
      client_options: {
        site: "https://sso.linuxdays.sikademo.com",
        user_info_url: "/realms/linuxdays/protocol/openid-connect/userinfo",
        authorize_url: "/realms/linuxdays/protocol/openid-connect/auth",
        token_url: "/realms/linuxdays/protocol/openid-connect/token"
      },
      user_response_structure: {
        root_path: [],
        id_path: ["sub"],
        attributes: {
          email: "email",
          name: "name"
        }
      },
      authorize_params: {
        scope: "openid profile email"
      },
      strategy_class: "OmniAuth::Strategies::OAuth2Generic"
    }
  }
]
```

## Install Grafana with SSO

```
kubectl apply -f grafana.yml
```

## Install oauth2-proxy

```
kubectl apply -f oauth2_proxy.yml
```

## Install Example App Behind oauth2-proxy

```
kubectl apply -f oauth2_proxy_example.yml
```
