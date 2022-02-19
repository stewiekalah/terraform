# Randomise KeyVault ID.
resource "random_string" "kv_idref" {
  length = 5
  number = true

}

#Keyvault Creation
resource "azurerm_key_vault" "kv" {
  name                        ="kv-${var.project}-${substr(var.location,0,3)}-${random_string.kv_idref.result}"
  location                    = var.location
  resource_group_name         = var.rgname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get", "backup", "delete", "list", "purge", "recover", "restore", "set",
    ]

    storage_permissions = [
      "get",
    ]
  }
}