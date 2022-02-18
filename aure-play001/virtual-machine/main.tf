# Create a resource group
resource "azurerm_resource_group" "vm" {
  name     = "rg-${var.project}-${var.stage}"
  location = var.location
}