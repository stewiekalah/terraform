module "resource_group" {
    source      = "./resource_group"
    global_vars = var.global_vars
}

module "storage_account" {
    source      = "./storage_account"
    global_vars = var.global_vars
    rg_name     = module.resource_group.name

    depends_on = [
      module.resource_group
    ]
}

module "app_service" {
    source      = "./app_service"
    global_vars = var.global_vars
    rg_name     = module.resource_group.name
    st_name     = module.storage_account.name
    st_id       = "WebsiteStorageConnectionString"
    st_access   = module.storage_account.access_key

    depends_on = [
      module.storage_account
    ]
}