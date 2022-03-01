resource "azurecaf_name" "storageaccount" {
  resource_type     = "azurerm_storage_account"
  name              = "${var.group_name}-${var.global_vars.stage}-${var.global_vars.locale}"
  clean_input       = true
  random_length     = 6
}

resource "azurerm_storage_account" "storageaccount" {
  name                = azurecaf_name.storageaccount.result
  resource_group_name = azurerm_resource_group.storageaccount.name

  location                 = var.global_vars.locale
  account_tier             = var.config_storageaccount.account_tier
  account_replication_type = var.config_storageaccount.account_replication_type
  account_kind             = var.config_storageaccount.account_kind
  allow_blob_public_access = var.config_storageaccount.allow_blob_public_access
}

resource "azurerm_storage_container" "storageaccount_blob" {
   name                   = var.config_storageaccount_blob.name
   storage_account_name   = azurerm_storage_account.storageaccount.name
   container_access_type  = var.config_storageaccount_blob.container_access_type
}

#Add index.html to blob storage
/* resource "azurerm_storage_blob" "webapp_storage" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.webapp_storage.name
  storage_container_name = azurerm_storage_container.webapp_blob.name
  type                   = "Block"
  content_type           = "text/html"
  source                 = "resources/index.html"

  depends_on = [
    azurerm_storage_container.webapp_blob
  ]
} */