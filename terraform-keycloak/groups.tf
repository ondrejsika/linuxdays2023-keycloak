resource "keycloak_group" "grafana-admin" {
  realm_id = keycloak_realm.linuxdays.id
  name     = "grafana-admin"
}

resource "keycloak_group" "grafana-viewer" {
  realm_id = keycloak_realm.linuxdays.id
  name     = "grafana-viewer"
}

resource "keycloak_group" "argocd-admin" {
  realm_id = keycloak_realm.linuxdays.id
  name     = "argocd-admin"
}
