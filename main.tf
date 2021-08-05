module "rg" {
source = "./module/rg"
}

module "network"{
source = "./module/network"
resource_group_name = "module.rg.name"
location = "eastus"
depends_on = [module.rg.azurerm_resource_group]
}
module "vm" {
source = "./module/vm"
resource_group_name = module.rg.resource_group_name1
location = "eastus"
subnet = module.network.subnet_id
security_group_id = module.network.security_group_id
}
