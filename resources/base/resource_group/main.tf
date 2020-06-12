###
# resource composition
###

#resource group

resource "azurerm_resource_group" "base" {
  name     = "${var.name_prefix}-${var.service_name}-${var.environment}-${var.region}"
  location = var.region
  tags     = var.tags
}