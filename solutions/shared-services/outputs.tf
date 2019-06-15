output "shared_vnet_hub_name" {
  value       = module.shared-network-hub.vnet_hub_name
  description = "Generated name of the hub virtual network"
}

output "shared_vnet_hub_id" {
  value       = module.shared-network-hub.vnet_hub_id
  description = "Resource id of the hub virtual network"
}

output "shared_vnet_hub_rg" {
  value       = module.shared-network-hub.vnet_hub_rg
  description = "Generated name of the resource group for hub virtual network"
}

output "diag_stor_id" {
  value       = module.diag_storage_account.storage_account_id
  description = "Resource id of the diagnostic storage account"
}

output "diag_stor_name" {
  value       = module.diag_storage_account.storage_account_name
  description = "Generated name for the diagnostic storage account"
}

