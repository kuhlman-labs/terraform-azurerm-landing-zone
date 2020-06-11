###
# resource composition
###

resource "azurerm_key_vault_certificate" "base" {
  name         = var.certificate_name
  key_vault_id = var.key_vault_id

  dynamic "certificate" {
    for_each = var.certificate
    content {
      contents = certificate.value.contents
      password = certificate.value.password
    }
  }

  certificate_policy {
    issuer_parameters {
      name = var.issuer_name
    }

    key_properties {
      exportable = var.exportable
      key_size   = var.key_size
      key_type   = var.key_type
      reuse_key  = var.reuse_key
    }
    lifetime_action {
      action {
        action_type = var.action_type
      }

      trigger {
        days_before_expiry  = var.days_before_expiry
        lifetime_percentage = var.lifetime_percentage
      }
    }

    secret_properties {
      content_type = var.content_type
    }
    x509_certificate_properties {
      extended_key_usage = var.extended_key_usage
      key_usage          = var.key_usage
      subject_alternative_names {
        dns_names = var.dns_names
        emails    = var.emails
        upns      = var.upns
      }
      subject            = var.subject
      validity_in_months = var.validity_in_months
    }
  }
}

