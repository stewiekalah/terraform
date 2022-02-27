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

    site_config {
      dotnet_framework_version = "v4.0"
      scm_type                 = "LocalGit"
    }

    app_settings = {
        "Test"  = "Value123"
    }

    connection_string {
      name = "DBConnection"
      type = "SQLServer"
      value = "Server=sql.dev.stantonarms.com;Integrated Security=SSPI"
    }

    depends_on = [
      azurerm_app_service_plan.webapp_app_service_plan
    ]
}