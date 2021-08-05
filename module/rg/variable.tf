provider "azurerm" {
features {}
}

variable "resource_group" {
   default = "myresource"
}
variable "location" {
default = "eastus"
}
