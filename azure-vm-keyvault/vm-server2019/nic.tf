resource "azurerm_network_interface" "vm-server2019-nic" {
  name                = "nic-${var.nameconvention}"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "ipConfig1"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}
