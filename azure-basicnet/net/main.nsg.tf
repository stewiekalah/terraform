resource "azurecaf_name" "net" {
  for_each = var.vnet_nsg_rules
    resource_type     = "azurerm_network_security_group"
    name              = "${each.key}-${var.group_name}-${var.global_vars.stage}-${var.global_vars.locale}"
    clean_input       = true
}

resource "azurerm_network_security_group" "net" {
  for_each = var.vnet_nsg_rules
    name                      = azurecaf_name.net[each.key].result
    location                  = var.global_vars.locale
    resource_group_name       = azurerm_resource_group.net.name

}

resource "azurerm_subnet_network_security_group_association" "net" {
  for_each = var.vnet_subnets
    network_security_group_id = azurerm_network_security_group.net[each.key].id
    subnet_id                 = azurerm_subnet.vnet_subnet[each.key].id

  depends_on = [
    azurerm_network_security_group.net,
    azurerm_subnet.vnet_subnet
  ]
}