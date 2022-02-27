resource "azurecaf_name" "webapp_app_service" {
    resource_type           = "azurerm_app_service"
    name                    = "${var.global_vars.project}-${var.global_vars.stage}-${var.global_vars.locale}"
    clean_input             = true
}

resource "azurerm_app_service" "webapp_app_service" {
    name                    = azurecaf_name.webapp_app_service.result
    location                = var.global_vars.locale
    resource_group_name     = var.rg_name
    app_service_plan_id     = azurerm_app_service_plan.webapp_app_service_plan.id

  storage_account {
    account_name = var.st_name
    share_name = "website"
    type = "AzureBlob"
    name = var.st_id
    access_key = var.st_access
    mount_path = "/site/wwwroot"
  }

    depends_on = [
      azurerm_app_service_plan.webapp_app_service_plan
    ]
}