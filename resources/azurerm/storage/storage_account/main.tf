###
# resource composition
###

#resource group

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

#random string

resource "random_string" "random" {
  length  = 4
  special = false
}

#storage account

resource "azurerm_storage_account" "example" {
  name                      = "${var.name_prefix}${substr(${var.environment}, 0, 2)}${random_string.random.result}${trim(${data.azurerm_resource_group.base.location}, "-")}"
  resource_group_name       = data.azurerm_resource_group.base.name
  location                  = data.azurerm_resource_group.base.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  is_hns_enabled            = var.is_hns_enabled

  dynamic "custom_domain" {
    for_each = var.custom_domain
    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties
    content {
      cors_rule {
        allowed_headers    = blob_properties.value.cors_rule_allowed_headers
        allowed_methods    = blob_properties.value.cors_rule_allowed_methods
        allowed_origins    = blob_properties.value.cors_rule_allowed_origins
        exposed_headers    = blob_properties.value.cors_rule_exposed_headers
        max_age_in_seconds = blob_properties.value.cors_rule_max_age_in_seconds
      }
      delete_retention_policy {
        days = blob_properties.value.delete_retention_policy_days
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.queue_properties
    content {
      cors_rule {
        allowed_headers    = queue_properties.value.cors_rule_allowed_headers
        allowed_methods    = queue_properties.value.cors_rule_allowed_methods
        allowed_origins    = queue_properties.value.cors_rule_allowed_origins
        exposed_headers    = queue_properties.value.cors_rule_exposed_headers
        max_age_in_seconds = queue_properties.value.cors_rule_max_age_in_seconds
      }
      logging {
        delete                = queue_properties.value.logging_delete
        read                  = queue_properties.value.logging_read
        version               = queue_properties.value.logging_version
        write                 = queue_properties.value.logging_write
        retention_policy_days = queue_properties.value.logging_retention_policy_days
      }
      minute_metrics {
        enabled               = queue_properties.value.minute_metrics_enabled
        version               = queue_properties.value.minute_metrics_version
        include_apis          = queue_properties.value.minute_metrics_include_apis
        retention_policy_days = queue_properties.value.minute_metrics_retention_policy_days
      }
      hour_metrics {
        enabled               = queue_properties.value.hour_metrics_enabled
        version               = queue_properties.value.hour_metrics_version
        include_apis          = queue_properties.value.hour_metrics_include_apis
        retention_policy_days = queue_properties.value.hour_metrics_retention_policy_days
      }
    }
  }

  dynamic "static_website" {
    for_each = var.static_website
    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      default_action             = network_rules.value.default_action
      ip_rules                   = network_rules.value.ip_rules
      bypass                     = network_rules.value.bypass
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }

  tags = var.tags
}