resource "azurecaf_name" "nic" {
    for_each=var.config_server_windows
        resource_type     = "azurerm_network_interface"
        name              = "${each.value.hostname}-${var.global_vars.stage}-${var.global_vars.locale}-${count.index}"
        clean_input       = true
}

resource "azurerm_network_interface" "servers_nic" {
    for_each = var.config_server_windows
        name                = azurecaf_name.nic[each.key].result
        location            = var.global_vars.locale
        resource_group_name = module.net.resource_group_name

        dynamic "ip_configuration" {
            for_each = merge(
                { for nic in var.config_server_windows : nic => "name" },
                { for nic in module.net.subnet : nic => "id" },
            )

            name                          = "ipConfig${count.index}"
            subnet_id                     = each.value.id
            private_ip_address_allocation = "Dynamic"
        }
}

variable "config_server_windows" {
        type = map
        default = {

        server01 = {
            hostname                    = "defualt"
            vm_size                     = "ukwest"
            image_publisher             = "Standard"
            image_offer                 = "LRS"
            image_version               = "StorageV2"
            delete_disk_on_termination  = true
            data_disk_size_gb           = 60
            data_disk_type              = "fixed"
        }
    }
}