output "resource_group_name" {
    value = azurecaf_name.rg.result
}

output "subnet" {
    value = {
        id = [for subnet in azurerm_subnet.vnet_subnet : subnet.id]
        name = [for subnet in azurerm_subnet.vnet_subnet : subnet.name]
    }
    sensitive = true
}