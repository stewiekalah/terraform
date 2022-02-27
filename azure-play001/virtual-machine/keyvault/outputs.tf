output "kv_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "kv_name" {
    value = azurerm_key_vault.kv.name
}

output "kv_rg" {
  value = azurerm_key_vault.kv.resource_group_name
}

output "kv_id" {
    value = azurerm_key_vault.kv.id
}

output "kv_secret-name-AdminPassword" {
    value = azurerm_key_vault_secret.secret-AdminPassword.name
    sensitive = true
}