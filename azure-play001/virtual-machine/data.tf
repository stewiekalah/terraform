data "azurerm_key_vault" "ansellpw" {
  name                = module.keyvault.kv_name
  resource_group_name = module.keyvault.kv_rg
}

data "azurerm_key_vault_secret" "kv_secret" {
  name                = module.keyvault.kv_secret-name-AdminPassword
  key_vault_id        = module.keyvault.kv_id
}