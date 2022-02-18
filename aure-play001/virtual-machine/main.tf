# Create a resource group
resource "azurerm_resource_group" "vm" {
  name     = "rg-vm-live"
  location = var.location
}