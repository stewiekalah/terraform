resource "azurerm_network_security_group" "nsg" {
  name                      = "nsg-${var.nameconvention}"
  location                  = var.location
  resource_group_name       = var.rgname

  # ALLOW - 80/443 Inbound
  security_rule {
    name                            = "Inbound-InternetTraffic"
    source_port_range               = "*"
    destination_port_ranges         = [ "80", "443" ]
    protocol                        = "Tcp"
    direction                       = "Inbound"
    priority                        = 100
    access                          = "Allow"
    source_address_prefix           = "*"
    destination_address_prefix      = "*"
  }

}

