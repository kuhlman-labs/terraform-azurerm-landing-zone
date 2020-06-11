###
# environment composition
###

module "network_isolated" {
  source        = "../modules/network_isolated"
  environment   = var.environment
  region        = var.region
  address_space = var.address_space
  tags          = var.tags
}

module "boot_diag_storage" {
  source      = "../modules/boot_diag_storage"
  environment = var.environment
  region      = var.region
}

module "sap_s4hana_linux" {
  source                         = "../modules/sap_s4hana_linux"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_isolated.virtual_network_resource_group_name
  virtual_network_name           = module.network_isolated.virtual_network_name
  address_prefix_app             = var.address_prefix_app
  address_prefix_data            = var.address_prefix_data
  storage_account_uri            = module.boot_diag_storage.primary_blob_endpoint
}

module "glusterfs_cluster" {
  source                         = "../modules/glusterfs_cluster"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_isolated.virtual_network_resource_group_name
  virtual_network_name           = module.network_isolated.virtual_network_name
  address_prefix_glusterfs       = var.address_prefix_glusterfs
  storage_account_uri            = module.boot_diag_storage.primary_blob_endpoint
}