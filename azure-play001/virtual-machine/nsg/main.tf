resource "azurerm_network_security_group" "nsg" {
  name                      = "nsg-${var.nameconvention}"
  location                  = var.location
  resource_group_name       = var.rgname

  # ALLOW - 80/443 Outbound
  security_rule {
    name                            = "Outbound-Allow-Internet"
    source_port_range               = "*"
    destination_port_ranges         = [ "80", "443" ]
    protocol                        = "Tcp"
    direction                       = "Outbound"
    priority                        = 100
    access                          = "Allow"
    source_address_prefix           = "*"
    destination_address_prefix      = "Internet"
  }

  # DENY - Internet (Override Azure Default Rule)
  security_rule {
    name                            = "Outbound-Deny-Internet-OverrideAzure"
    source_port_range               = "*"
    destination_port_range          = "*"
    protocol                        = "Tcp"
    direction                       = "Outbound"
    priority                        = 1000
    access                          = "Deny"
    source_address_prefix           = "*"
    destination_address_prefix      = "Internet"
  }

}

