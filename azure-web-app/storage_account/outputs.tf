output "name" {
    value = azurerm_storage_account.webapp_storage.name
}

output "access_key" {
    value = azurerm_storage_account.webapp_storage.primary_access_key
    sensitive = true
}

output "id" {
    value = azurerm_storage_account.webapp_storage.id
    sensitive = true
}