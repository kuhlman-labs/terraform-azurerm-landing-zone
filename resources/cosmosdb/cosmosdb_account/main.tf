###
# resource composition
###

#random string

resource "random_string" "base" {
  length  = 4
  special = false
}

#cosmosdb_account

resource "azurerm_cosmosdb_account" "base" {
  name                            = lower("${var.name_prefix}-${random_string.base.result}-${var.environment}-${var.region}")
  location                        = var.region
  resource_group_name             = var.resource_group
  offer_type                      = var.offer_type
  kind                            = var.kind
  enable_free_tier                = var.enable_free_tier

  consistency_policy {
    consistency_level       = var.consistency_level
  }

  geo_location {
    location          = var.region
    failover_priority = 0
  }

  tags = var.tags
}