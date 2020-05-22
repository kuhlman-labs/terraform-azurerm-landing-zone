###
# resource composition
###

resource "azurerm_app_service_plan" "example" {
  name                         = "${var.name_prefix}-${var.environment}-${var.region}"
  location                     = var.region
  resource_group_name          = var.resource_group
  kind                         = var.kind
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  app_service_environment_id   = var.app_service_environment_id
  reserved                     = var.reserved
  per_site_scaling             = var.per_site_scaling
  sku {
    tier     = var.sku_tier
    size     = var.sku_size
    capacity = var.sku_capacity
  }
  tags = var.tags
}