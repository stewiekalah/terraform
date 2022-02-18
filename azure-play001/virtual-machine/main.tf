module "resource-group" {
  source            = "./resource-group"
  project           = var.project
  env               = var.environment
  location          = var.location

}

module "vnet" {
    source          = "./vnet"
    location        = var.location
    rgname          = module.resource-group.name
    nameconvention  = local.naming

    depends_on = [
      module.resource-group
    ]
}

module "nsg" {
    source          = "./nsg"
    location        = var.location
    nameconvention  = local.naming
    rgname          = module.resource-group.name
    subnet_id       = module.vnet.subnet_id

    depends_on = [
      module.vnet
    ]
}

module "vm" {
  source                      = "./vm-server2019"
  location                    = var.location
  nameconvention              = local.naming
  rgname                      = module.resource-group.name
  subnet_id                   = module.vnet.subnet_id
  adminUser                   = var.adminUser
  adminPass                   = data.azurerm_key_vault_secret.kv_secret.value
  computer_name               = "vm-test-01"
  vm_size                     = "Standard_B4ms"
  image_publisher             = "MicrosoftWindowsServer"
  image_offer                 = "WindowsServer"
  image_sku                   = "2019-Datacenter-smalldisk"
  image_version               = "latest"
  delete_disk_on_termination  = true

  depends_on = [
    module.nsg
  ]
}