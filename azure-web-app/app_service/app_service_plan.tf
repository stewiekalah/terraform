resource "azurecaf_name" "webapp_app_service" {
    resource_type           = "azurerm_app_service"
    name              = "${var.global_vars.project}-${var.global_vars.locale}"
    clean_input       = true
}