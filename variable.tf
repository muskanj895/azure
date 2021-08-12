variable "address_space" {
default = "10.0.0.0/16"
}
 variable "subnet_name" {
  default = ["subnet1","subnet2"]
 }
variable "subnet_prefix" {
default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "resource_group" {
   default = "myresource"
}
variable "location" {
default = "eastus"
}
variable "vnet" {
default = "mj"
}
variable "ipname" {
default = "mypublicip"
}
variable "nicname" {
default = "myNIC"
}
