resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "${var.ipname}"
    location                     = "${var.location}"
    resource_group_name          = "${var.resource_group_name}"
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}
# Created a NIC
resource "azurerm_network_interface" "myterraformnic" {
    name                        = "${var.nicname}"
    location                    = "${var.location}"
    resource_group_name         =  "${var.resource_group_name}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${var.subnet}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }

    tags = {
        environment = "Terraform Demo"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.myterraformnic.id
    network_security_group_id = "${var.security_group_id}"
}
resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                  = "muskan"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "muskan"
    admin_password = "muskan@123"
    disable_password_authentication = false



    tags = {
        environment = "Terraform Demo"
    }
}
