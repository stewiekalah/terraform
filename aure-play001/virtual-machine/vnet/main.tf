resource "azurerm_virtual_network" "vnet" {
  name = "vnet-${var.project}-${substr(var.location,0,3)}-${var.environment}"
  location = var.location
  resource_group_name = var.rgname
  address_space = [ "192.168.128.0/18" ]

}

resource "azurerm_subnet" "vnet" {
  name = "snet-vm"
  address_prefixes = [ "192.168.128.0/24" ]
  virtual_network_name = "vnet-${var.nameconvention}"
  resource_group_name = var.rgname
  depends_on = [
      "vnet-${var.nameconvention}"
  ]
}