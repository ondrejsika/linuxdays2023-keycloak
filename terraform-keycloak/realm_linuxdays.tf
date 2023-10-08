resource "keycloak_realm" "linuxdays" {
  realm                    = "linuxdays"
  enabled                  = true
  display_name_html        = "<h1>LinuxDays SSO</h1>"
  login_with_email_allowed = true
  reset_password_allowed   = true
  remember_me              = true
}

resource "keycloak_realm_events" "sikalabs" {
  lifecycle {
    ignore_changes = [
      events_listeners,
    ]
  }

  realm_id = keycloak_realm.linuxdays.id

  events_enabled    = true
  events_expiration = 3600

  admin_events_enabled         = true
  admin_events_details_enabled = true
}

resource "keycloak_openid_client_scope" "linuxdays_groups" {
  realm_id               = keycloak_realm.linuxdays.id
  name                   = "groups"
  include_in_token_scope = true
  gui_order              = 1
}

resource "keycloak_openid_group_membership_protocol_mapper" "linuxdays_groups" {
  realm_id        = keycloak_realm.linuxdays.id
  client_scope_id = keycloak_openid_client_scope.linuxdays_groups.id
  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}
