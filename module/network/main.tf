resource "azurerm_virtual_network" "example" {
  name                = "${var.vnet}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = ["${var.address_space}"]
}
resource "azurerm_subnet" "example" {
    name                 = "${var.subnet_name[count.index]}"
    resource_group_name  ="${var.resource_group_name}"
    virtual_network_name = "${azurerm_virtual_network.example.name}"
    address_prefix       = "${var.subnet_prefix[count.index]}"
    count   ="${length(var.subnet_name)}"
}

resource "azurerm_network_security_group" "tamopsnsg" {
  name                = "tamopstest"
  location            = "eastus2"
  resource_group_name = "${var.resource_group_name}"

}

resource "azurerm_network_security_rule" "testrules" {
  for_each                    = "${var.security_rule}"
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = azurerm_network_security_group.tamopsnsg.name
}
