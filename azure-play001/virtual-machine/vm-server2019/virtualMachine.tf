resource "azurerm_virtual_machine" "vm-server2019" {
  name                  = "vm-${var.nameconvention}"
  location              = var.location
  resource_group_name   = var.rgname
  network_interface_ids = [ azurerm_network_interface.vm-server2019-nic.id ]
  vm_size               = "Standard_B4ms"

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  os_profile_windows_config {}

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "MicrosoftWindowsServer"
    sku       = "[smalldisk] Windows Server 2019 Datacenter (2019-Datacenter-smalldisk)"
    version   = "latest"
  }
  storage_os_disk {
    name              = "st-disk0-${var.nameconvention}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vm-test-01"
    admin_username = "stuart"
    admin_password = var.adminPass
  }

  depends_on = [
    azurerm_network_interface.vm-server2019-nic
  ]
}