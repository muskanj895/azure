output "subnet_id" {
value = "${azurerm_subnet.example[0].id}"
}
output "security_group_id" {
value ="${azurerm_network_security_group.tamopsnsg.id}"

}
output "vnet_id" {
value = "${azurerm_virtual_network.example.id}"
}
