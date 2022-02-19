module "resource_group" {
    source      = "./resource_group"
    project     = var.project
    stage       = var.stage
    location    = var.location
}