variable "config_keyvault" {
  type = map
  default = {
      generated_secret_length       = 24
      generated_secret_use_special  = true
      name_randomstring_length      = 2
      name_randomstring_number      = true
      enabled_for_disk_encryption   = true
      soft_delete_retention_days    = 7
      purge_protection_enabled      = false
      sku_name                      = "standard"
  }
}

variable "config_keyvault_permissions" {
  type = map
  default = {
      key_permissions               = [
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