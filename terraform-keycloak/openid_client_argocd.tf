resource "keycloak_openid_client" "argocd" {
  realm_id                     = keycloak_realm.linuxdays.id
  client_id                    = "argocd"
  name                         = "argocd"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "argocd_secret"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
  valid_post_logout_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "argocd" {
  realm_id  = keycloak_realm.linuxdays.id
  client_id = keycloak_openid_client.argocd.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.linuxdays_groups.name,
  ]
}
