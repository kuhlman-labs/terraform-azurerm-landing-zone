output "vnet_rg_name" {
  value       = "${data.azurerm_resource_group.vnet.name}"
  description = "Generated vnet resource group name"
}

output "vnet_rg_id" {
  value       = "${data.azurerm_resource_group.vnet.id}"
  description = "Vnet owning resource group id"
}

output "vnet_name" {
  value       = "${azurerm_virtual_network.main.name}"
  description = "Generated vnet name"
}

output "vnet_id" {
  value       = "${azurerm_virtual_network.main.id}"
  description = "vnet resource id"
}
