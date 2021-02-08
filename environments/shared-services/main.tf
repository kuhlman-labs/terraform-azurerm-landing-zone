###
# environment composition
###

module "network_hub" {
  source                 = "../../modules/network_hub"
  environment            = var.environment
  region                 = var.region
  address_space          = var.address_space
  address_prefix_bastion = var.address_prefix_bastion
  address_prefix_agw     = var.address_prefix_agw
  address_prefix_fw      = var.address_prefix_fw
  tags                   = var.tags
}

module "container_registry" {
  source      = "../../modules/container_registry"
  environment = var.environment
  region      = var.region
  tags        = var.tags
  sku         = "premium"
}

module "key_vault" {
  source      = "../../modules/key_vault"
  environment = var.environment
  region      = var.region
  object_id   = var.object_id
  tags        = var.tags
  sku_name    = "premium"
}

module "logging" {
  source      = "../../modules/logs"
  environment = var.environment
  region      = var.region
}