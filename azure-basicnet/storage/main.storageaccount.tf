resource "azurecaf_name" "storageaccount" {
  for_each=var.config_storageaccount
  resource_type     = "azurerm_storage_account"
  name              = "${each.key}-${var.global_vars.stage}-${each.value.location}"
  clean_input       = true
  random_length     = 6
}

resource "azurerm_storage_account" "storageaccount" {
  for_each=var.config_storageaccount
  name                = azurecaf_name.storageaccount[each.key].result
  resource_group_name = azurerm_resource_group.storageaccount.name

  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind
  allow_blob_public_access = each.value.allow_blob_public_access
}

resource "azurerm_storage_container" "storageaccount_blob" {
  for_each=var.config_storageaccount
   name                   = each.value.blob.name
   storage_account_name   = azurerm_storage_account.storageaccount[each.key].name
   container_access_type  = each.value.blob.container_access_type

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