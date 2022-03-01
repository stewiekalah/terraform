module "net" {
    source                              = "./net"
    group_name                          = "net"
    global_vars                         = var.global_vars

    vnet_configuration_address_space    = var.vnet_configuration_address_space
    vnet_subnet_servers                 = var.vnet_subnet_servers
    vnet_subnet_servers_addresses       = var.vnet_subnet_servers_addresses
    vnet_nsg_rules                      = var.vnet_nsg_rules
}

module "vault" {
    source                          = "./vault"
    group_name                      = "vault"
    global_vars                     = var.global_vars

    config_keyvault                 = var.config_keyvault
    config_keyvault_permissions     = var.config_keyvault_permissions
}