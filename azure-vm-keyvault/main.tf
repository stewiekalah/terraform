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

module "keyvault" {
  source                      = "./keyvault"
  project         = var.project
  environment     = var.environment
  location        = var.location
  nameconvention  = local.naming
  rgname          = module.resource-group.name

  depends_on = [
    module.resource-group
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
  computer_name               = var.computer_name
  vm_size                     = var.vm_size
  image_publisher             = var.image_publisher
  image_offer                 = var.image_offer
  image_sku                   = var.image_sku
  image_version               = var.image_version
  delete_disk_on_termination  = var.delete_disk_on_termination
  data_disk_size_gb           = var.data_disk_size_gb
  data_disk_type              = var.data_disk_type

  depends_on = [
    module.nsg
  ]
}