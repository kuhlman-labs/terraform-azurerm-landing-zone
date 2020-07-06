###
# environment composition
###

module "network_hub" {
  source        = "../../modules/network_hub"
  environment   = var.environment
  region        = var.region
  address_space = var.address_space
  dns_servers   = concat(var.private_ip_address_adds, ["168.63.129.16"])
  tags          = var.tags
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

module "boot_diag_storage" {
  source      = "../../modules/boot_diag_storage"
  environment = var.environment
  region      = var.region
  tags        = var.tags
}

module "audit_logs" {
  source      = "../../modules/audit_logs"
  environment = var.environment
  region      = var.region
}

module "domain_controllers" {
  source                         = "../../modules/domain_controllers"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_hub.virtual_network_name
  address_prefix_adds            = var.address_prefix_adds
  storage_account_uri            = module.boot_diag_storage.primary_blob_endpoint
  private_ip_address_adds        = var.private_ip_address_adds
  tags                           = var.tags
}

module "bastion" {
  source                         = "../../modules/bastion"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_hub.virtual_network_name
  address_prefix_bastion         = var.address_prefix_bastion
  tags                           = var.tags
}