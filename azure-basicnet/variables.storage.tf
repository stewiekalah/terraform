variable "config_storageaccount" {
  type = map
  default = {

    storage1 = {
      name = "defualt"
      location = "ukwest"
      account_tier             = "Standard"
      account_replication_type = "LRS"
      account_kind             = "StorageV2"
      allow_blob_public_access = true

      blob = {
        name = null
        container_access_type = null
      }
    }

  }
}