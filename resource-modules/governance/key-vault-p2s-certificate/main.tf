############################
# Setting up P2S Certificate
############################

resource "azurerm_key_vault_certificate" "base" {
  name         = "P2SRootCert"
  key_vault_id = var.key_vault_id

  certificate {
    contents = var.certificate_contents
    password = var.certificate_password
  }

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = false
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }
  }
}

