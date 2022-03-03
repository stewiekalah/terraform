locals {
    for_each =var.vnet_subnets
    nsg_rules = values(each.value.nsg_rules)
}

resource "azurerm_network_security_rule" "net_rule" {
  for_each                    = {
    for map in flatten([
      for key, subnet_name in var.vnet_subnets : [
        for subnet_rule, nsg_rule in subnet_name : [
          for rule_name, rule_values in nsg_rule :
          {
            rule_name = rule_name
            rule_values = rule_values
          }
        ]
      ]
    ]) : map.name => map.value
  }
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.net.name
  network_security_group_name = azurerm_network_security_group.net[each.key].name
}
