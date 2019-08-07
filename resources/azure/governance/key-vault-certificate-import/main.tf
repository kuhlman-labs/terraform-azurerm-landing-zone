############################
#  P2S Certificate
############################

resource "azurerm_key_vault_certificate" "base" {
  name         = var.certificate_name
  key_vault_id = var.key_vault_id

  certificate {
    contents = filebase64(var.certificate_contents)
    password = var.certificate_password
  }

  certificate_policy {
    issuer_parameters {
      name = var.issuer_name
    }

    key_properties {
      exportable = var.key_exportable
      key_size   = var.key_size
      key_type   = var.key_type
      reuse_key  = var.key_reuse
    }

    secret_properties {
      content_type = var.secret_content_type
    }
  }
}

