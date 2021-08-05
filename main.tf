module "rg" {
source = "./module/rg"
}

module "network"{
source = "./module/network"
resource_group_name = "module.rg.name"
location = "eastus"
depends_on = [module.rg.azurerm_resource_group]
}
