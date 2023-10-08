resource "keycloak_openid_client" "gitlab" {
  realm_id                     = keycloak_realm.linuxdays.id
  client_id                    = "gitlab"
  name                         = "gitlab"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "gitlab_secret"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "gitlab" {
  realm_id  = keycloak_realm.linuxdays.id
  client_id = keycloak_openid_client.gitlab.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.linuxdays_groups.name,
  ]
}
