###
# resource variables
###

#common

variable "resource_group" {
  description = "The name of the target resource group"
  type        = string
}

variable "name_prefix" {
  description = "A short pre-defined text to identify the resource type"
  type        = string
  default     = "app"
}

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

#app service

variable "app_service_plan_id" {
  description = "(Required) The ID of the App Service Plan within which to create this App Service."
  type        = string
}

variable "app_settings" {
  description = "(Optional) A key-value pair of App Settings."
  type        = map(any)
  default     = null
}

variable "auth_settings" {
  description = "(Optional) A auth_settings block as defined below."
  type        = list(any)
  default     = []
  /*
  enabled - (Required) Is Authentication enabled?
  active_directory - (Optional) A active_directory block as defined below.
    client_id - (Required) The Client ID of this relying party application. Enables OpenIDConnection authentication with Azure Active Directory.
    client_secret - (Optional) The Client Secret of this relying party application. If no secret is provided, implicit flow will be used.
    allowed_audiences (Optional) Allowed audience values to consider when validating JWTs issued by Azure Active Directory.
  additional_login_params - (Optional) Login parameters to send to the OpenID Connect authorization endpoint when a user logs in. Each parameter must be in the form "key=value".
  allowed_external_redirect_urls - (Optional) External URLs that can be redirected to as part of logging in or logging out of the app.
  default_provider - (Optional) The default provider to use when multiple providers have been set up. Possible values are AzureActiveDirectory, Facebook, Google, MicrosoftAccount and Twitter.
  NOTE:
  When using multiple providers, the default provider must be set for settings like unauthenticated_client_action to work.
  facebook - (Optional) A facebook block as defined below.
    app_id - (Required) The App ID of the Facebook app used for login
    app_secret - (Required) The App Secret of the Facebook app used for Facebook Login.
    oauth_scopes (Optional) The OAuth 2.0 scopes that will be requested as part of Facebook Login authentication. https://developers.facebook.com/docs/facebook-login
  google - (Optional) A google block as defined below.
    client_id - (Required) The OpenID Connect Client ID for the Google web application.
    client_secret - (Required) The client secret associated with the Google web application.
    oauth_scopes (Optional) The OAuth 2.0 scopes that will be requested as part of Google Sign-In authentication. https://developers.google.com/identity/sign-in/web/
  issuer - (Optional) Issuer URI. When using Azure Active Directory, this value is the URI of the directory tenant, e.g. https://sts.windows.net/{tenant-guid}/.
  microsoft - (Optional) A microsoft block as defined below.
    client_id - (Required) The OAuth 2.0 client ID that was created for the app used for authentication.
    client_secret - (Required) The OAuth 2.0 client secret that was created for the app used for authentication.
    oauth_scopes (Optional) The OAuth 2.0 scopes that will be requested as part of Microsoft Account authentication. https://msdn.microsoft.com/en-us/library/dn631845.aspx
  runtime_version - (Optional) The runtime version of the Authentication/Authorization module.
  token_refresh_extension_hours - (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72.
  token_store_enabled - (Optional) If enabled the module will durably store platform-specific security tokens that are obtained during login flows. Defaults to false.
  twitter - (Optional) A twitter block as defined below.
  unauthenticated_client_action - (Optional) The action to take when an unauthenticated client attempts to access the app. Possible values are AllowAnonymous and RedirectToLoginPage.
  */
}

variable "backup" {
  description = "(Optional) A backup block as defined below."
  type        = list(any)
  default     = []
  /*
  name (Required) Specifies the name for this Backup.
  enabled - (Required) Is this Backup enabled?
  storage_account_url (Optional) The SAS URL to a Storage Container where Backups should be saved.
  schedule - (Optional) A schedule block as defined below.
    frequency_interval - (Required) Sets how often the backup should be executed.
    frequency_unit - (Optional) Sets the unit of time for how often the backup should be executed. Possible values are Day or Hour.
    keep_at_least_one_backup - (Optional) Should at least one backup always be kept in the Storage Account by the Retention Policy, regardless of how old it is?
    retention_period_in_days - (Optional) Specifies the number of days after which Backups should be deleted.
    start_time - (Optional) Sets when the schedule should start working.
  */
}

variable "client_affinity_enabled" {
  description = "(Optional) Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  type        = bool
  default     = null
}

variable "client_cert_enabled" {
  description = "(Optional) Does the App Service require client certificates for incoming requests? Defaults to false."
  type        = bool
  default     = null
}

variable "connection_string" {
  description = " (Optional) One or more connection_string blocks as defined below."
  type        = list(any)
  default     = []
  /*
  name - (Required) The name of the Connection String.
  type - (Required) The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer.
  value - (Required) The value for the Connection String.
  */
}

variable "enabled" {
  description = "(Optional) Is the App Service Enabled?"
  type        = bool
  default     = null
}

variable "https_only" {
  description = "(Optional) Can the App Service only be accessed via HTTPS? Defaults to false."
  type        = bool
  default     = null
}

variable "identity" {
  description = "(Optional) A Managed Service Identity block as defined below."
  type        = list(any)
  default     = []
  /*
  type - (Required) Specifies the identity type of the App Service. Possible values are SystemAssigned (where Azure will generate a Service Principal for you), UserAssigned where you can specify the Service Principal IDs in the identity_ids field, and SystemAssigned, UserAssigned which assigns both a system managed identity as well as the specified user assigned identities.
  NOTE:
  When type is set to SystemAssigned, The assigned principal_id and tenant_id can be retrieved after the App Service has been created. More details are available below.
  identity_ids - (Optional) Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned.
  */
}

variable "logs" {
  description = "(Optional) A logs block as defined below."
  type        = list(any)
  default     = []
  /*
  application_logs - (Optional) An application_logs block as defined below.
    azure_blob_storage - (Optional) An azure_blob_storage block as defined below.
      level - (Required) The level at which to log. Possible values include Error, Warning, Information, Verbose and Off. NOTE: this field is not available for http_logs
      sas_url - (Required) The URL to the storage container, with a Service SAS token appended. NOTE: there is currently no means of generating Service SAS tokens with the azurerm provider.
      retention_in_days - (Required) The number of days to retain logs for.
  http_logs - (Optional) An http_logs block as defined below.
    file_system - (Optional) A file_system block as defined below.
      retention_in_days - (Required) The number of days to retain logs for.
      retention_in_mb - (Required) The maximum size in megabytes that http log files can use before being removed.
    azure_blob_storage - (Optional) An azure_blob_storage block as defined below.
      level - (Required) The level at which to log. Possible values include Error, Warning, Information, Verbose and Off. NOTE: this field is not available for http_logs
      sas_url - (Required) The URL to the storage container, with a Service SAS token appended. NOTE: there is currently no means of generating Service SAS tokens with the azurerm provider.
      retention_in_days - (Required) The number of days to retain logs for.
  */
}

variable "site_config" {
  description = "(Optional) A site_config block as defined below."
  type        = list(any)
  default     = []
  /*
  always_on - (Optional) Should the app be loaded at all times? Defaults to false.
  app_command_line - (Optional) App command line to launch, e.g. /sbin/myserver -b 0.0.0.0.
  cors - (Optional) A cors block as defined below.
  default_documents - (Optional) The ordering of default documents to load, if an address isn't specified.
  dotnet_framework_version - (Optional) The version of the .net framework's CLR used in this App Service. Possible values are v2.0 (which will use the latest version of the .net framework for the .net CLR v2 - currently .net 3.5) and v4.0 (which corresponds to the latest version of the .net CLR v4 - which at the time of writing is .net 4.7.1). For more information on which .net CLR version to use based on the .net framework you're targeting - please see this table. Defaults to v4.0.
  ftps_state - (Optional) State of FTP / FTPS service for this App Service. Possible values include: AllAllowed, FtpsOnly and Disabled.
  health_check_path - (Optional) The health check path to be pinged by App Service. For more information - please see the corresponding Kudu Wiki page.
  Note:
  This functionality is in Preview and is subject to changes (including breaking changes) on Azure's end
  http2_enabled - (Optional) Is HTTP2 Enabled on this App Service? Defaults to false.
  ip_restriction - (Optional) A List of objects representing ip restrictions as defined below.
    ip_address - (Optional) The IP Address used for this IP Restriction in CIDR notation.
    virtual_network_subnet_id - (Optional) The Virtual Network Subnet ID used for this IP Restriction.
    NOTE:
    One of either ip_address or virtual_network_subnet_id must be specified
    name - (Optional) The name for this IP Restriction.
    priority - (Optional) The priority for this IP Restriction. Restrictions are enforced in priority order. By default, priority is set to 65000 if not specified.
    action - (Optional) Does this restriction Allow or Deny access for this IP range. Defaults to Allow.
  NOTE
  User has to explicitly set ip_restriction to empty slice ([]) to remove it.
  java_version - (Optional) The version of Java to use. If specified java_container and java_container_version must also be specified. Possible values are 1.7, 1.8 and 11 and their specific versions - except for Java 11 (e.g. 1.7.0_80, 1.8.0_181, 11)
  java_container - (Optional) The Java Container to use. If specified java_version and java_container_version must also be specified. Possible values are JAVA, JETTY, and TOMCAT.
  java_container_version - (Optional) The version of the Java Container to use. If specified java_version and java_container must also be specified.
  local_mysql_enabled - (Optional) Is "MySQL In App" Enabled? This runs a local MySQL instance with your app and shares resources from the App Service plan.
  NOTE:
  MySQL In App is not intended for production environments and will not scale beyond a single instance. Instead you may wish to use Azure Database for MySQL.
  linux_fx_version - (Optional) Linux App Framework and version for the App Service. Possible options are a Docker container (DOCKER|<user/image:tag>), a base-64 encoded Docker Compose file (COMPOSE|${filebase64("compose.yml")}) or a base-64 encoded Kubernetes Manifest (KUBE|${filebase64("kubernetes.yml")}).
  windows_fx_version - (Optional) The Windows Docker container image (DOCKER|<user/image:tag>)
  Additional examples of how to run Containers via the azurerm_app_service resource can be found in the ./examples/app-service directory within the Github Repository.
  managed_pipeline_mode - (Optional) The Managed Pipeline Mode. Possible values are Integrated and Classic. Defaults to Integrated.
  min_tls_version - (Optional) The minimum supported TLS version for the app service. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new app services.
  php_version - (Optional) The version of PHP to use in this App Service. Possible values are 5.5, 5.6, 7.0, 7.1, 7.2, and 7.3.
  python_version - (Optional) The version of Python to use in this App Service. Possible values are 2.7 and 3.4.
  remote_debugging_enabled - (Optional) Is Remote Debugging Enabled? Defaults to false.
  remote_debugging_version - (Optional) Which version of Visual Studio should the Remote Debugger be compatible with? Possible values are VS2012, VS2013, VS2015 and VS2017.
  scm_type - (Optional) The type of Source Control enabled for this App Service. Defaults to None. Possible values are: BitbucketGit, BitbucketHg, CodePlexGit, CodePlexHg, Dropbox, ExternalGit, ExternalHg, GitHub, LocalGit, None, OneDrive, Tfs, VSO, and VSTSRM
  use_32_bit_worker_process - (Optional) Should the App Service run in 32 bit mode, rather than 64 bit mode?
  NOTE:
  when using an App Service Plan in the Free or Shared Tiers use_32_bit_worker_process must be set to true.
  websockets_enabled - (Optional) Should WebSockets be enabled?
  */
}

variable "storage_account" {
  description = "(Optional) One or more storage_account blocks as defined below."
  type        = list(any)
  default     = []
  /*
name - (Required) The name of the storage account identifier.
type - (Required) The type of storage. Possible values are AzureBlob and AzureFiles.
account_name - (Required) The name of the storage account.
share_name - (Required) The name of the file share (container name, for Blob storage).
access_key - (Required) The access key for the storage account.
mount_path - (Optional) The path to mount the storage within the site's runtime environment.
  */
}


#tags

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}
