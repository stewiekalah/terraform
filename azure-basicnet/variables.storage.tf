variable "config_storageaccount" {
  type = map
  default = {
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    allow_blob_public_access = true
  }
}

variable "config_storageaccount_blob" {
  type = map
  default = {
    name = "website"
    container_access_type = "blob"
  }
}