data "azurerm_key_vault" "ansellpw" {
  name                = var.kv_name
  resource_group_name = var.kv_rg

}

data "azurerm_key_vault_secret" "kv_secret" {
  name = var.kv_secret-AdminPassword
  key_vault_id = data.azurerm_key_vault.ansellpw.id
}