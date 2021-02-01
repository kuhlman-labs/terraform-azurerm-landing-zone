###
#  module composition
###

#resource group

module "resource_group" {
  source       = "../../resources/base/resource_group"
  service_name = "aks-demo"
  region       = var.region
  environment  = var.environment
  tags         = var.tags
}

#subnets

module "subnet" {
  source               = "../../resources/network/subnet"
  resource_group       = var.virtual_network_resource_group
  region               = module.resource_group.location
  virtual_network_name = var.virtual_network_name
  name_prefixes        = ["snet-agw", "snet-aks-nodes"]
  address_prefixes     = concat(var.address_prefix_agw, var.address_prefix_aks)
  environment          = var.environment
}

#agw

module "public_ip" {
  source            = "../../resources/network/public_ip"
  resource_group    = module.resource_group.name
  region            = module.resource_group.location
  environment       = var.environment
  name_prefix       = "pip-agw"
  allocation_method = "Static"
  sku               = "Standard"
  tags              = var.tags
}

module "application_gateway" {
  source               = "../../resources/network/application_gateway"
  resource_group       = module.resource_group.name
  region               = module.resource_group.location
  name_prefix          = "agw-aks"
  sku_name             = "WAF_v2"
  sku_tier             = "WAF_v2"
  subnet_id            = element(module.subnet.id, 0)
  public_ip_address_id = module.public_ip.id
  environment          = var.environment
  tags                 = var.tags
}


#aks cluster

module "aks" {
  source         = "../../resources/container/kubernetes_cluster"
  resource_group = module.resource_group.name
  region         = module.resource_group.location
  environment    = var.environment
  vm_size        = var.vm_size
  node_count     = var.node_count
  vnet_subnet_id = element(module.subnet.id, 1)
  tags = var.tags
}