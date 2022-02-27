resource "azurerm_virtual_network" "vnet" {
  name                  = "vnet-${var.nameconvention}"
  location              = var.location
  resource_group_name   = var.rgname
  address_space         = [ "192.168.128.0/18" ]

}

resource "azurerm_subnet" "subnet" {
  name                  = "snet-vm"
  address_prefixes      = [ "192.168.128.0/24" ]
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = var.rgname

  depends_on = [
      azurerm_virtual_network.vnet
  ]
}