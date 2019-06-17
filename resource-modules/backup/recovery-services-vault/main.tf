###########################
#Setting up Locals for Tags
###########################

locals {
  MANDATORY_TAGS = {
    Name           = data.azurerm_resource_group.vault.name
    Owner          = var.owner_tag
    region         = var.region_tag
    Cost-Center    = var.cost_center_tag
    Approver       = var.approver_tag
    Service-Hours  = var.service_hours_tag
    
  }
}

###########################
# Setting up Resource Group
###########################

data "azurerm_resource_group" "vault" {
  name = var.resource_group
}

####################################
# Setting up Recovery Services Vault
####################################

resource "azurerm_recovery_services_vault" "main" {
  name                = data.azurerm_resource_group.vault.name
  location            = data.azurerm_resource_group.vault.location
  resource_group_name = data.azurerm_resource_group.vault.name
  sku                 = var.sku

  tags = merge(local.MANDATORY_TAGS, var.optional_tags)
}

