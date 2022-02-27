provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "tftest" {
  location = var.location
  name = "rg-${var.project}-${var.stage}"
}

resource "azurerm_network_security_group" "tftest" {
  name = "nsg-${var.project}-${substr(azurerm_resource_group.tftest.location,0,3)}-${var.stage}"
  location = azurerm_resource_group.tftest.location
  resource_group_name = azurerm_resource_group.tftest.name
}

resource "azurerm_virtual_network" "tftest" {
  name = "vnet-${var.project}-${substr(azurerm_resource_group.tftest.location,0,3)}-${var.stage}"
  location = azurerm_resource_group.tftest.location
  resource_group_name = azurerm_resource_group.tftest.name
  address_space = [ "192.168.128.0/18" ]
  depends_on = [
    azurerm_network_security_group.tftest
  ]
}

resource "azurerm_subnet" "tftest" {
  name = "snet-vm"
  address_prefixes = [ "192.168.128.0/24" ]
  virtual_network_name = azurerm_virtual_network.tftest.name
  resource_group_name = azurerm_resource_group.tftest.name
  depends_on = [
    azurerm_virtual_network.tftest
  ]
}

resource "azurerm_subnet_network_security_group_association" "tftest" {
  network_security_group_id = azurerm_network_security_group.tftest.id
  subnet_id = azurerm_subnet.tftest.id
  depends_on = [
    azurerm_subnet.tftest
  ]
}