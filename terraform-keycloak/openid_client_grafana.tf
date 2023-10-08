resource "keycloak_openid_client" "grafana" {
  realm_id              = keycloak_realm.linuxdays.id
  client_id             = "grafana"
  name                  = "grafana"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  client_secret         = "grafana_secret"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "grafana" {
  realm_id  = keycloak_realm.linuxdays.id
  client_id = keycloak_openid_client.grafana.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.linuxdays_groups.name,
  ]
}
