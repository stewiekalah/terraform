module "resource-group" {
  source            = "./resource-group"
  project           = var.project
  env               = var.environment
  location          = var.location

}

module "vnet" {
    source          = "./vnet"
    location        = var.location
    project         = var.project
    environment     = var.environment
    rgname          = module.resource-group.name
    nameconvention  = local.naming

    depends_on = [
      module.resource-group
    ]
}

module "nsg" {
    source = "./nsg"
    location = "${var.location}"
    project = "${var.project}"
    environment = "${var.environment}"
    nameconvention = "${local.naming}"
    rgname = module.resource-group.name
    subnet_id = module.vnet.subnet_id
    depends_on = [
      module.vnet
    ]
}

module "vm" {
  source = "./vm-server2019"
  location = "${var.location}"
  project = "${var.project}"
  environment = "${var.environment}"
  nameconvention = "${local.naming}"
  rgname = module.resource-group.name
  subnet_id = module.vnet.subnet_id
  adminUser = var.adminUser
  adminPass = var.adminPass

  depends_on = [
    module.nsg
  ]
}