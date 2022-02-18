# Create a resource group
resource "azurerm_resource_group" "vm" {
  name     = "rg-${var.project}-${substr(var.location,0,3)}-live"
  location = var.location
}