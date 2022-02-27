resource "azurecaf_name" "webapp_storage" {
  resource_type     = "azurerm_storage_account"
  name              = "${var.global_vars.project}"
  clean_input       = true
  random_length     = 6
}

resource "azurerm_storage_account" "webapp_storage" {
  name                = azurecaf_name.webapp_storage.result
  resource_group_name = var.rg_name

  location                 = var.global_vars.locale
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  allow_blob_public_access = true

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_container" "webapp_blob" {
   name = "website"
   storage_account_name = "${azurerm_storage_account.webapp_storage.name}"
   container_access_type = "blob"
}


#Add index.html to blob storage
resource "azurerm_storage_blob" "webapp_storage" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.webapp_storage.name
  storage_container_name = azurerm_storage_container.webapp_blob.name
  type                   = "Block"
  content_type           = "text/html"
  source                 = "resources/index.html"

  depends_on = [
    azurerm_storage_container.webapp_blob
  ]
}