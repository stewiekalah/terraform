﻿resource "azurecaf_name" "vnet" {
  resource_type     = "azurerm_virtual_network"
  name              = "${var.group_name}-${var.global_vars.stage}-${var.global_vars.locale}"
  clean_input       = true
}

resource "azurecaf_name" "vnet_subnet" {
  for_each = var.vnet_subnets
  resource_type     = "azurerm_subnet"
  name              = each.key
  clean_input       = true
}

resource "azurerm_virtual_network" "vnet" {
  name                  = azurecaf_name.vnet.result
  location              = var.global_vars.locale
  resource_group_name   = azurecaf_name.rg.result
  address_space         = var.vnet_configuration_address_space

  depends_on = [
    azurerm_resource_group.net
  ]
}

resource "azurerm_subnet" "vnet_subnet" {
  for_each = var.vnet_subnets
  name                  = azurecaf_name.vnet_subnet[each.key].result
  address_prefixes      = each.value.addresses
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurecaf_name.rg.result

  depends_on = [
      azurerm_virtual_network.vnet
  ]
}