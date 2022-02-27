resource "azurecaf_naming_convention" "web-app" {
  prefix            = "rg"
  name              = var.project
  postfix           = var.stage
  convention        = "cafclassic"
}

resource "azurerm_resource_group" "web-app" {
  name      = azurerm_resource_group.web-app
  location  = var.location
}