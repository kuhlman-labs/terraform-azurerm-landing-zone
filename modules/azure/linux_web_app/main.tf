###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "linux-web-app"
  region       = var.region
  environment  = var.environment
}

module "app_service_plan" {
  source         = "../../../resources/azurerm/app_service/app_service_plan"
  name_prefix    = "asp-linux"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  reserved       = true
  kind           = "Linux"
  sku_tier       = "Basic"
  sku_size       = "B1"
}

module "app_service" {
  source              = "../../../resources/azurerm/app_service/app_service"
  name_prefix         = "app-test"
  resource_group      = module.resource_group.name
  region              = module.resource_group.location
  environment         = var.environment
  app_service_plan_id = module.app_service_plan.id
}