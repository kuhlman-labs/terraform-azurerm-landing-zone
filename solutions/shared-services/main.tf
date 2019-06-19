##############################
# Shared Services Composistion
##############################

module "shared-network-hub" {
  source              = "../../infrastructure-modules/network-hub"
  vnet_address_ranges = var.vnet_address_ranges
  subnets_hub         = var.subnets_hub
  nsg_rules_dmz       = var.nsg_rules
  #certificate_data      = module.key-vault-with-p2s-cert.key_vault_p2s_certificate_data
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols
  environment           = var.environment
  region                = var.region

  #TAGS#
  approver_tag      = var.approver_tag
  owner_tag         = var.owner_tag
  region_tag        = var.region_tag
  cost_center_tag   = var.cost_center_tag
  service_hours_tag = var.service_hours_tagoptional_tags = var.optional_tags
}