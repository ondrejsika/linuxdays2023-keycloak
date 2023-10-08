resource "keycloak_user" "ondrej" {
  realm_id       = keycloak_realm.linuxdays.id
  username       = "ondrej"
  enabled        = true
  email          = "ondrej@sika.io"
  email_verified = true
  first_name     = "Ondrej"
  last_name      = "Sika"
  initial_password {
    value     = var.user_initial_password
    temporary = true
  }
}

resource "keycloak_user_groups" "ondrej" {
  realm_id = keycloak_realm.linuxdays.id
  user_id  = keycloak_user.ondrej.id
  group_ids = [
    keycloak_group.argocd-admin.id,
    keycloak_group.grafana-admin.id,
  ]
}
