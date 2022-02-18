resource "azurerm_network_interface" "vm-server2019-nic" {
  name                = "nic-${var.naming}"
  location            = azurerm_resource_group.vm.location
  resource_group_name = "${var.rgname}"

  ip_configuration {
    name                          = "nic-vm-01"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}