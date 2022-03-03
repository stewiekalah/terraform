resource "azurecaf_name" "rg" {
  resource_type     = "azurerm_resource_group"
  name              = "${var.group_name}-${var.global_vars.stage}"
  clean_input       = true
}

 resource "azurerm_resource_group" "vault" {
  name      = azurecaf_name.rg.result
  location  = var.global_vars.locale
}