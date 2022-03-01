resource "azurecaf_name" "vault" {
  resource_type     = "azurerm_key_vault"
  name              = "${var.group_name}-${var.global_vars.stage}-${var.global_vars.locale}"
  clean_input       = true
}

# Randomise KeyVault ID.
resource "random_string" "vault" {
  length = var.config_keyvault.name_randomstring_length
  number = var.config_keyvault.name_randomstring_number
  special = false

}

resource "random_password" "vault_secret" {
  length = var.config_keyvault.generated_secret_length
  special = var.config_keyvault.generated_secret_use_special
}

#Keyvault Creation
resource "azurerm_key_vault" "vault" {
  name                        ="${azurecaf_name.vault.result}-${random_string.vault.result}"
  location                    = var.global_vars.locale
  resource_group_name         = azurerm_resource_group.vault.name
  enabled_for_disk_encryption = var.config_keyvault.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.config_keyvault.soft_delete_retention_days
  purge_protection_enabled    = var.config_keyvault.purge_protection_enabled

  sku_name = var.config_keyvault.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.config_keyvault_permissions.key_permissions
    secret_permissions = var.config_keyvault_permissions.secret_permissions
    storage_permissions = var.config_keyvault_permissions.storage_permissions
  }
}

#Create Key Vault Secret
resource "azurerm_key_vault_secret" "vault_generated_secret" {
  name         = "DeployGeneratedSecret"
  value        = random_password.vault_secret.result
  key_vault_id = azurerm_key_vault.vault.id

  depends_on = [
      azurerm_key_vault.vault
  ]
}