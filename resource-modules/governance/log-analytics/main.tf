###########################
#Setting up Locals for Tags
###########################

locals {
  mandatory_tags = {
    Name           = data.azurerm_resource_group.log_analytics.name
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

data "azurerm_resource_group" "log_analytics" {
  name = var.resource_group
}

####################################
# Setting up Log Analytics Workspace
####################################

resource "azurerm_log_analytics_workspace" "main" {
  name                = data.azurerm_resource_group.log_analytics.name
  location            = data.azurerm_resource_group.log_analytics.location
  resource_group_name = data.azurerm_resource_group.log_analytics.name
  sku                 = var.sku
  retention_in_days   = var.retention_period

  tags = merge(local.mandatory_tags, var.optional_tags)
}

