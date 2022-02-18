# Create a resource group
resource "azurerm_resource_group" "vm" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
}

module "vnet" {
    source = "./vnet"
    location = var.location
    project = var.project
    environment = var.environment
    rgname = azurerm_resource_group.vm.name
}