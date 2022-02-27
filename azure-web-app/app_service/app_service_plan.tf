resource "azurecaf_name" "webapp_app_service_plan" {
    resource_type           = "azurerm_app_service_plan"
    name                    = "${var.global_vars.project}-${var.global_vars.stage}-${var.global_vars.locale}"
    clean_input             = true
}

resource "azurerm_app_service_plan" "webapp_app_service_plan" {
    name                    = azurecaf_name.webapp_app_service_plan.result
    location                = var.global_vars.locale
    resource_group_name     = var.rg_name

    sku {
      size = "S1"
      tier = "Standard"
    }
}