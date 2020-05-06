###
# resource composition
###

#local variables

provider "azurerm" {
  features{}
}

locals {
  backend_address_pool_name      = "${var.name_prefix}-beap"
  frontend_port_name             = "${var.name_prefix}-feport"
  frontend_ip_configuration_name = "${var.name_prefix}-feip"
  http_setting_name              = "${var.name_prefix}-be-htst"
  listener_name                  = "${var.name_prefix}-httplstn"
  request_routing_rule_name      = "${var.name_prefix}-rqrt"
}

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#application gateway

resource "azurerm_application_gateway" "base" {
  name                = "${var.name_prefix}-${var.environment}-${data.azurerm_resource_group.base.location}"
  resource_group_name = data.azurerm_resource_group.base.name
  location            = data.azurerm_resource_group.base.location

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  zones = var.zones

  frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}-public"
    public_ip_address_id = var.public_ip_address_id
    private_ip_address   = var.private_ip_address
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "${local.frontend_port_name}-80"
    port = 80
  }

  frontend_port {
  name = "${local.frontend_port_name}-443"
  port = 443
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}-private"
    frontend_port_name             = "${local.frontend_port_name}-80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [tags, backend_address_pool, backend_http_settings, frontend_ip_configuration, frontend_port, http_listener, probe, request_routing_rule]
  }
}
