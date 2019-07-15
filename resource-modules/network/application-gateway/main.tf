##################
#Setting up locals
##################

locals {
  backend_address_pool_name      = "${var.appgw_vnet_name}-beap"
  frontend_port_name             = "${var.appgw_vnet_name}-feport"
  frontend_ip_configuration_name = "${var.appgw_vnet_name}-feip"
  http_setting_name              = "${var.appgw_vnet_name}-be-htst"
  listener_name                  = "${var.appgw_vnet_name}-httplstn"
  request_routing_rule_name      = "${var.appgw_vnet_name}-rqrt"
}

###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}


# Setting up app_gw public ip

resource "azurerm_public_ip" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-ip"
  resource_group_name = data.azurerm_resource_group.base.name
  location            = data.azurerm_resource_group.base.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  resource_group_name = data.azurerm_resource_group.base.name
  location            = data.azurerm_resource_group.base.location

  sku {
    name     = var.appgw_sku
    tier     = var.appgw_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-ip-configuration"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = "${local.frontend_port_name}"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}"
    public_ip_address_id = "${azurerm_public_ip.base.id}"
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
  tags = var.tags

  #'aks with waf ingress' specific configuration
  lifecycle {
    ignore_changes = [tags, backend_address_pool, backend_http_settings, frontend_ip_configuration, frontend_port, http_listener, probe, request_routing_rule]
  }
}