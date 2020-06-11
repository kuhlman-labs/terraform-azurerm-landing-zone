###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../resources/base/resource_group"
  service_name = "container-registry"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#container registry

module "container_registry" {
  source         = "../resources/container/container_registry"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  sku            = var.sku
  tags           = var.tags
}
