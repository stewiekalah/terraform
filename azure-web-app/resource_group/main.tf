provider "azurecaf" {
  features {}
}

resource "azurecaf_naming_convention" "web-app" {
  resource_type     = "rg"
  name              = var.project
  postfix           = var.stage
  convention        = "cafclassic"
}

resource "azurerm_resource_group" "web-app" {
  name      = "${var.prefix}-${var.project}-${var.stage}"
  location  = var.location
}