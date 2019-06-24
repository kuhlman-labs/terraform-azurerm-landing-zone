########################################
#Setting up Locals for Tags and Resource
########################################

locals {
  mandatory_tags = {
    Owner         = var.owner_tag
    region        = var.region_tag
    Cost-Center   = var.cost_center_tag
    Approver      = var.approver_tag
    Service-Hours = var.service_hours_tag
  }
  #block for hardcoded names
  backend_address_pool_name      = "${var.appgw_vnet_name}-beap"
  frontend_port_name             = "${var.appgw_vnet_name}-feport"
  frontend_ip_configuration_name = "${var.appgw_vnet_name}-feip"
  http_setting_name              = "${var.appgw_vnet_name}-be-htst"
  listener_name                  = "${var.appgw_vnet_name}-httplstn"
  request_routing_rule_name      = "${var.appgw_vnet_name}-rqrt"
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "appgw" {
  name = var.resource_group
}


# Setting up appgw public IP

resource "azurerm_public_ip" "appgw_ip" {
  name                = "${var.appgw_name}-ip"
  resource_group_name = data.azurerm_resource_group.appgw.name
  location            = data.azurerm_resource_group.appgw.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  resource_group_name = data.azurerm_resource_group.appgw.name
  location            = data.azurerm_resource_group.appgw.location

  sku {
    name     = var.appgw_sku
    tier     = var.appgw_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${var.appgw_name}-ip-configuration"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = "${local.frontend_port_name}"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}"
    public_ip_address_id = "${azurerm_public_ip.appgw_ip.id}"
  }

  backend_address_pool {
    name = "${local.backend_address_pool_name}"
  }

  backend_http_settings {
    name                  = "${local.http_setting_name}"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${local.listener_name}"
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}"
    frontend_port_name             = "${local.frontend_port_name}"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${local.request_routing_rule_name}"
    rule_type                  = "Basic"
    http_listener_name         = "${local.listener_name}"
    backend_address_pool_name  = "${local.backend_address_pool_name}"
    backend_http_settings_name = "${local.http_setting_name}"
  }
  tags = merge(local.mandatory_tags, var.optional_tags)
}