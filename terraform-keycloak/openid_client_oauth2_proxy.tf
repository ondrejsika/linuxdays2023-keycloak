resource "keycloak_openid_client" "oauth2_proxy" {
  realm_id                     = keycloak_realm.linuxdays.id
  client_id                    = "oauth2_proxy"
  name                         = "oauth2_proxy"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "oauth2_proxy_secret"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "oauth2_proxy" {
  realm_id  = keycloak_realm.linuxdays.id
  client_id = keycloak_openid_client.oauth2_proxy.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.linuxdays_groups.name,
  ]
}

resource "keycloak_openid_audience_protocol_mapper" "oauth2_proxy" {
  realm_id                 = keycloak_realm.linuxdays.id
  client_id                = keycloak_openid_client.oauth2_proxy.id
  name                     = "audience-mapper"
  included_client_audience = keycloak_openid_client.oauth2_proxy.client_id
}
