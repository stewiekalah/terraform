resource "azurecaf_name" "webapp" {
  resource_type     = "azurerm_resource_group"
  name              = "${var.global_vars.project}-${var.global_vars.stage}"
  clean_input       = true
}

 resource "azurerm_resource_group" "web-app" {
  name      = azurecaf_name.webapp.result
  location  = var.global_vars.locale
}