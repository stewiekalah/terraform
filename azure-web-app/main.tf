module "resource_group" {
    source      = "./resource_group"
    project     = var.project
    stage       = var.stage
    location    = var.location
}

module "app_service" {
    source      = "./app_service"
    global_vars = var.global_vars
}