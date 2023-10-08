resource "keycloak_user" "grafana-viewer" {
  realm_id       = keycloak_realm.linuxdays.id
  username       = "grafana-viewer"
  enabled        = true
  email          = "grafana-viewer@sikademo.com"
  email_verified = true
  initial_password {
    value     = var.user_initial_password
    temporary = true
  }
}

resource "keycloak_user_groups" "grafana-viewer" {
  realm_id = keycloak_realm.linuxdays.id
  user_id  = keycloak_user.grafana-viewer.id
  group_ids = [
    keycloak_group.grafana-viewer.id,
  ]
}
