resource "keycloak_user" "foo" {
  realm_id       = keycloak_realm.linuxdays.id
  username       = "foo"
  enabled        = true
  email          = "foo@sikademo.com"
  email_verified = true
  first_name     = "Foo"
  last_name      = "Foo"
  initial_password {
    value     = var.user_initial_password
    temporary = true
  }
}

resource "keycloak_user_groups" "foo" {
  realm_id  = keycloak_realm.linuxdays.id
  user_id   = keycloak_user.foo.id
  group_ids = []
}
