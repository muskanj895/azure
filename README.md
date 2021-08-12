# Deploy a virtual Machine using terraform module on azure
This Terraform module deploys Virtual Machine in Azure. This module requires a network and resource group to be provided separately such as the "Azure/network" and "Azure/rg" modules.
This terraform module deploy a linux server and output that vm id.

## Usage
This module contains 3 modules. One for resource group, second for network and third for creating a virtual machine.
```
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

```

