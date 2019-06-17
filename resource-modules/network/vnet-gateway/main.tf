###########################
#Setting up Locals for Tags
###########################

locals {
  mandatory_tags = {
    Name           = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}"
    Owner          = var.owner_tag
    region         = var.region_tag
    Cost-Center    = var.cost_center_tag
    Approver       = var.approver_tag
    Service-Hours  = var.service_hours_tag
    Cloudreach-ops = var.cloudreach_ops_tag
  }
}

########################################################################################
# Setting up Resource Group *****Must be deployed in same resource group as the vNet****
########################################################################################

data "azurerm_resource_group" "vnet" {
  name = var.resource_group
}

######################################
# Setting up Public IP for VPN Gateway
######################################

resource "azurerm_public_ip" "vnet_gateway" {
  name                = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}-IP"
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name
  allocation_method   = var.ip_allocation
}

#################################
# Setting up VPN Gateway Resource
#################################

resource "azurerm_virtual_network_gateway" "main" {
  name                = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}"
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name

  type     = var.gateway_type
  vpn_type = var.vpn_type

  sku = var.sku

  ip_configuration {
    name                          = azurerm_public_ip.vnet_gateway.name
    public_ip_address_id          = azurerm_public_ip.vnet_gateway.id
    private_ip_address_allocation = var.ip_allocation
    subnet_id                     = var.gateway_subnet
  }

  #################################
  # Setting up VPN P2S Connection
  #################################

  vpn_client_configuration {
    address_space        = var.client_address_spaces
    vpn_client_protocols = var.vpn_client_protocols

  /*  root_certificate {
      name = "Self-signed-P2S-KV-cert"

      public_cert_data = base64encode(var.certificate_data)
    }*/
  } 
  tags = merge(local.mandatory_tags, var.optional_tags)
}

