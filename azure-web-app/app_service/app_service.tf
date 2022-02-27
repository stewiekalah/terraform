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

    depends_on = [
      azurerm_app_service_plan.webapp_app_service_plan
    ]
}