###
#  solution composition
###

provider "azurerm" {
  features {}
}

module "network_hub" {
  source               = "../../modules/azure/network_hub"
  environment          = "sandbox-hub"
  region               = "westus"
  address_space        = ["10.0.0.0/16"]
  subnet_name_prefixes = ["snet-management"]
  address_prefixes     = ["10.0.1.0/24"]
  address_prefix_vgw   = ["10.0.2.0/24"]
  address_prefix_fw    = ["10.0.3.0/24"]
}

module "network_spoke_1" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = "sandbox-spoke-1"
  region                                  = "westus"
  address_space                           = ["10.1.0.0/16"]
  subnet_name_prefixes                    = ["snet-management"]
  address_prefixes                        = ["10.1.0.0/24"]
  virtual_network_hub_resource_group_name = module.network_hub.virtual_network_resource_group_name
  virtual_network_hub_name                = module.network_hub.virtual_network_name
  virtual_network_hub_id                  = module.network_hub.virtual_network_id
}

module "network_spoke_2" {
  source                                  = "../../modules/azure/network_spoke"
  environment                             = "sandbox-spoke-2"
  region                                  = "westus"
  address_space                           = ["10.2.0.0/16"]
  subnet_name_prefixes                    = ["snet-management"]
  address_prefixes                        = ["10.2.0.0/24"]
  virtual_network_hub_resource_group_name = module.network_hub.virtual_network_resource_group_name
  virtual_network_hub_name                = module.network_hub.virtual_network_name
  virtual_network_hub_id                  = module.network_hub.virtual_network_id
}

module "diagnostic_storage_account" {
  source      = "../../modules/azure/diagnostic_storage_account"
  environment = "sandbox-hub"
  region      = "westus"
}

module "windows_jumpbox" {
  source              = "../../modules/azure/windows_jumpbox"
  environment         = "sandbox-hub"
  region              = "westus"
  subnet_id           = element(module.network_hub.subnet_id, 0)
  storage_account_uri = module.diagnostic_storage_account.primary_blob_endpoint
}

module "domain_controllers" {
  source                         = "../../modules/azure/domain_controllers"
  environment                    = "sandbox-hub"
  region                         = "westus"
  virtual_network_resource_group = module.network_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_hub.virtual_network_name
  address_prefix_adds            = ["10.0.0.0/24"]
  storage_account_uri            = module.diagnostic_storage_account.primary_blob_endpoint
  private_ip_address_adds        = ["10.0.0.100", "10.0.0.101"]
}