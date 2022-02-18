output "nic_id" {
  value     = azurerm_network_interface.vm-server2019-nic.id
}

output "vm_name" {
  value     = azurerm_virtual_machine.vm-server2019.name
}