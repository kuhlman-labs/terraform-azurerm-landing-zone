###
#  module composition
###

#resource group
/*
module "resource_group" {
  source       = "../../../resources/azurerm/base/resource_group"
  service_name = "key-vault"
  region       = var.region
  environment  = var.environment
}
*/

resource "null_resource" "p2s_cert_generate" {
  provisioner "local-exec" {
    command = <<EOT
    ({${templatefile("../../../bin/cert-gen-p2s.ps1", {
      root_cert_name  = "P2SAzureRoot",
      child_cert_name = "P2SAzureChild",
      file_path       = abspath(path.module)
    })}}) | powershell.exe -Command "-"
    EOT
  }
}