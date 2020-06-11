###
# resource outputs
###

output "virtual_machine_id" {
  value       = module.virtual_machine.id
  description = "The ID of the Windows Virtual Machine."
}