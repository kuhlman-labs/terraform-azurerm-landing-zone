###
# resource composition
###

#resource group

resource "azurerm_resource_group" "base" {
  name     = "rg-${var.name_prefix}-${var.environment}-${var.region}"
  location = var.region
  tags     = var.tags
}