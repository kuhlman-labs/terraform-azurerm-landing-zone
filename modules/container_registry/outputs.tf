###
#  module outputs
###

output "container_registry_id" {
  value       = module.container_registry.id
  description = "The ID of the Container Registry."
}