###
# environment composition
###

module "network_hub" {
  source                 = "../../modules/network_hub"
  environment            = var.environment
  region                 = var.region
  address_space          = var.address_space
  address_prefix_bastion = var.address_prefix_bastion
  tags                   = var.tags
}

module "container_registry" {
  source      = "../../modules/container_registry"
  environment = var.environment
  region      = var.region
  tags        = var.tags
}

module "key_vault" {
  source      = "../../modules/key_vault"
  environment = var.environment
  region      = var.region
  object_id   = var.object_id
  tags        = var.tags
}

module "logging" {
  source      = "../../modules/logs"
  environment = var.environment
  region      = var.region
}