resource "azurerm_virtual_machine" "vm-server2019" {
  name                              = "vm-${var.nameconvention}"
  location                          = var.location
  resource_group_name               = var.rgname
  network_interface_ids = [
    azurerm_network_interface.vm-server2019-nic.id
  ]
  vm_size                           = var.vm_size

  delete_os_disk_on_termination     = var.delete_disk_on_termination
  delete_data_disks_on_termination  = var.delete_disk_on_termination

  os_profile_windows_config {}

  storage_image_reference {
    publisher                       = var.image_publisher
    offer                           = var.image_offer
    sku                             = var.image_sku
    version                         = var.image_version
  }
  storage_os_disk {
    name                            = "st${azurerm_virtual_machine.vm-server2019.name}-0"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
  }
  os_profile {
    computer_name                   = var.computer_name
    admin_username                  = var.adminUser
    admin_password                  = var.adminPass
  }

  depends_on = [
    azurerm_network_interface.vm-server2019-nic
  ]
}