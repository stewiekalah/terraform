resource "azurecaf_name" "net" {
  resource_type     = "azurerm_network_security_group"
  name              = "${var.group_name}-${var.global_vars.stage}-${var.global_vars.locale}"
  clean_input       = true
}

resource "azurerm_network_security_group" "net" {
  name                      = azurecaf_name.net.result
  location                  = var.global_vars.locale
  resource_group_name       = azurerm_resource_group.net.name

}

resource "azurerm_network_security_rule" "net" {
  for_each                    = var.vnet_nsg_rules
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.net.name
  network_security_group_name = azurerm_network_security_group.net.name
}

resource "azurerm_subnet_network_security_group_association" "net" {
  for_each = var.vnet_subnets
    network_security_group_id = azurerm_network_security_group.net.id
    subnet_id                 = azurerm_subnet.vnet_subnet[each.key].id

  depends_on = [
    azurerm_network_security_group.net,
    azurerm_subnet.vnet_subnet
  ]
}