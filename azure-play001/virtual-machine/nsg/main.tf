resource "azurerm_network_security_group" "nsg" {
  name                      = "nsg-${var.nameconvention}"
  location                  = var.location
  resource_group_name       = var.rgname
}

resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = var.subnet_id

  depends_on = [
    azurerm_network_security_group.nsg
  ]
}