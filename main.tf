provider "azurerm" {
  features {}
}
module "rg" {
source = "./module/rg"
resource_group ="${var.resource_group}"
location = "eastus"
}
module "network"{
source = "./module/network"
resource_group_name = module.rg.resource_group_name1
location = "eastus"
vnet = "${var.vnet}"
subnet_name = "${var.subnet_name}"
address_space ="${var.address_space}"
subnet_prefix = "${var.subnet_prefix}"
security_rule = local.nsgrules
}
module "vm" {
source = "./module/vm"
resource_group_name = module.rg.resource_group_name1
location = "eastus"
subnet = module.network.subnet_id
security_group_id = module.network.security_group_id
ipname = "${var.ipname}"
vnet = "${var.vnet}"
nicname = "${var.nicname}"
}


