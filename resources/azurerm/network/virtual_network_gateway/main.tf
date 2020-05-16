###
# resource composition
###

#public ip

data "azurerm_public_ip" "base" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group
}

#subnet

resource "azurerm_subnet" "base" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

#virtual network gateway

resource "azurerm_virtual_network_gateway" "base" {
  name                = "${var.name_prefix}-${var.environment}-${var.region}"
  location            = var.region
  resource_group_name = var.resource_group

  type     = var.type
  vpn_type = var.vpn_type

  active_active                    = var.active_active
  enable_bgp                       = var.enable_bgp
  default_local_network_gateway_id = var.default_local_network_gateway_id
  sku                              = var.sku
  generation                       = var.generation

  ip_configuration {
    name                          = data.azurerm_public_ip.base.name
    public_ip_address_id          = data.azurerm_public_ip.base.id
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = azurerm_subnet.base.id
  }

  vpn_client_configuration {
    address_space        = var.address_space
    vpn_client_protocols = var.vpn_client_protocols

    root_certificate {
      name             = var.root_certificate_name
      public_cert_data = base64encode(var.public_cert_data)
    }
    /*
    dynamic "revoked_certificate" {
      for_each = var.revoked_certificate
      content {
        name       = var.revoked_certificate.value.name
        thumbprint = var.revoked_certificate.value.thumbprint
      }      
    }
  */
  }
  tags = var.tags
}

