output "kv_uri" {
  value             = data.azurerm_key_vault.ansellpw.vault_uri
  sensitive         = true
}

output "kv_secret_adminpass" {
  value             = data.azurerm_key_vault_secret.kv_secret.value
  sensitive         = true
}