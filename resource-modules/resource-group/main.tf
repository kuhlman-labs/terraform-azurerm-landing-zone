resource "azurerm_resource_group" "main" {
  name     = "${upper(var.resource_prefix)}-${upper(var.region)}-${upper(var.environment)}"
  location = "${var.region}"
}
