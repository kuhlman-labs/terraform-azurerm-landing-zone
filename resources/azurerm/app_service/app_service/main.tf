###
# resource composition
###

#app service

resource "azurerm_app_service" "base" {
  name                    = "example-app-service"
  location                = var.region
  resource_group_name     = var.resource_group
  app_service_plan_id     = var.app_service_plan_id
  app_settings            = var.app_settings
  client_affinity_enabled = var.client_affinity_enabled
  client_cert_enabled     = var.client_cert_enabled
  enabled                 = var.enabled
  https_only              = var.https_only
  tags                    = var.tags

  dynamic "auth_settings" {
    for_each = var.auth_settings
    content {
      enabled = auth_settings.value.enabled
      active_directory {
        client_id     = auth_settings.value.active_directory_client_id
        client_secret = auth_settings.value.active_directory_client_secret
      }
      additional_login_params        = auth_settings.value.additional_login_params
      allowed_external_redirect_urls = auth_settings.value.allowed_external_redirect_urls
      default_provider               = auth_settings.value.default_provider
      facebook {
        app_id       = auth_settings.value.facebook_app_id
        app_secret   = auth_settings.value.facebook_app_secret
        oauth_scopes = auth_settings.value.facebook_oauth_scopes
      }
      google {
        client_id     = auth_settings.value.google_client_id
        client_secret = auth_settings.value.google_client_secret
        oauth_scopes  = auth_settings.value.google_oauth_scopes
      }
      microsoft {
        client_id     = auth_settings.value.microsoft_client_id
        client_secret = auth_settings.value.microsoft_client_secret
        oauth_scopes  = auth_settings.value.microsoft_oauth_scopes
      }
      twitter {
        consumer_key    = auth_settings.value.twitter_consumer_key
        consumer_secret = auth_settings.value.twitter_consumer_secret
      }
      issuer                        = auth_settings.value.issuer
      runtime_version               = auth_settings.value.runtime_version
      token_refresh_extension_hours = auth_settings.value.token_refresh_extension_hours
      token_store_enabled           = auth_settings.value.token_store_enabled
      unauthenticated_client_action = auth_settings.value.unauthenticated_client_action
    }
  }
  dynamic "storage_account" {
    for_each = var.storage_account
    content {
      name         = storage_account.value.name
      type         = storage_account.value.type
      account_name = storage_account.value.account_name
      share_name   = storage_account.value.share_name
      access_key   = storage_account.value.access_key
      mount_path   = storage_account.value.mount_path
    }
  }
  dynamic "backup" {
    for_each = var.backup
    content {
      name                = backup.value.name
      enabled             = backup.value.enabled
      storage_account_url = backup.value.storage_account_url
      schedule {
        frequency_interval       = backup.value.schedule_frequency_interval
        frequency_unit           = backup.value.schedule_frequency_unit
        keep_at_least_one_backup = backup.value.schedule_keep_at_least_one_backup
        retention_period_in_days = backup.value.schedule_retention_period_in_days
        start_time               = backup.value.schedule_start_time
      }
    }
  }
  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }
  dynamic "site_config" {
    for_each = var.site_config
    content {
      always_on        = site_config.value.always_on
      app_command_line = site_config.value.app_command_line
      cors {
        allowed_origins     = site_config.value.cors_allowed_origins
        support_credentials = site_config.value.cors_support_credentials
      }
      default_documents         = site_config.value.default_documents
      dotnet_framework_version  = site_config.value.dotnet_framework_version
      ftps_state                = site_config.value.ftps_state
      health_check_plan         = site_config.value.health_check_plan
      http2_enabled             = site_config.value.http2_enabled
      ip_restriction            = site_config.value.ip_restriction
      java_version              = site_config.value.java_version
      java_container            = site_config.value.java_container
      java_container_version    = site_config.value.java_container_version
      local_mysql_enabled       = site_config.value.local_mysql_enabled
      linux_fx_version          = site_config.value.linux_fx_version
      windows_fx_version        = site_config.value.windows_fx_version
      managed_pipeline_mode     = site_config.value.managed_pipeline_mode
      min_tls_version           = site_config.value.min_tls_version
      php_version               = site_config.value.php_version
      python_version            = site_config.value.python_version
      remote_debugging_enabled  = site_config.value.remote_debugging_enabled
      remote_debugging_version  = site_config.value.remote_debugging_version
      scm_type                  = site_config.value.scm_type
      use_32_bit_worker_process = site_config.value.use_32_bit_worker_process
      websockets_enabled        = site_config.value.websockets_enabled

    }
  }
  dynamic "identity" {
    for_each = var.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  dynamic "logs" {
    for_each = var.logs
    content {
      application_logs {
        azure_blob_storage {
          level             = logs.application_logs_azure_blob_storage_level
          sas_url           = logs.application_logs_azure_blob_storage_sas_url
          retention_in_days = logs.application_logs_azure_blob_storage_retention_in_days
        }
      }
      http_logs {
        file_system {
          retention_in_days = logs.http_logs_file_system_retention_in_days
          retention_in_mb   = logs.http_logs_file_system_retention_in_mb

        }
        azure_blob_storage {
          level             = logs.http_logs_azure_blob_storage_level
          sas_url           = logs.http_logs_azure_blob_storage_sas_url
          retention_in_days = logs.http_logs_azure_blob_storage_retention_in_days
        }
      }
    }
  }
}