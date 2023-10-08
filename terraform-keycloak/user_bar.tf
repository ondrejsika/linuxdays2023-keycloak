resource "keycloak_user" "bar" {
  realm_id       = keycloak_realm.linuxdays.id
  username       = "bar"
  enabled        = true
  email          = "bar@sikademo.com"
  email_verified = true
  first_name     = "Bar"
  last_name      = "Bar"
  initial_password {
    value     = var.user_initial_password
    temporary = true
  }
}

resource "keycloak_user_groups" "bar" {
  realm_id  = keycloak_realm.linuxdays.id
  user_id   = keycloak_user.bar.id
  group_ids = []
}
