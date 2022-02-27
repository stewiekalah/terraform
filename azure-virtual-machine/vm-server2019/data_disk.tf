resource "azurerm_managed_disk" "data_disk" {
  name                  = "st${azurerm_virtual_machine.vm-server2019.name}-1"
  location              = azurerm_virtual_machine.vm-server2019.location
  resource_group_name   = azurerm_virtual_machine.vm-server2019.resource_group_name
  disk_size_gb          = var.data_disk_size_gb
  storage_account_type  = var.data_disk_type
  create_option         = "Empty"
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk" {
  managed_disk_id       = azurerm_managed_disk.data_disk.id
  virtual_machine_id    = azurerm_virtual_machine.vm-server2019.id
  lun                   = "10"
  caching               = "ReadWrite"

  depends_on = [
    azurerm_virtual_machine.vm-server2019
  ]
}