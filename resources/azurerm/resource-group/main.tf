###
# resource composition
###

#resource group

resource "azurerm_resource_group" "base" {
  name     = "${var.environment}-${var.region}-${var.resource_prefix}"
  location = var.region
}