resource "random_password" "secret-AdminPassword" {
  length = 24
  special = true
}

#Create Key Vault Secret
resource "azurerm_key_vault_secret" "secret-AdminPassword" {
  name         = "Terraform-VMDeploy-AdminPassword"
  value        = random_password.secret-AdminPassword.result
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
      azurerm_key_vault.kv
  ]
}