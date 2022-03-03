variable "vnet_configuration_address_space" {
  type = list
  default = [ "192.168.128.0/18" ]
}

variable "vnet_subnet_servers" {
  type = map
  default = {
    name    = "snet-servers"
  }
}

variable "vnet_subnet_servers_addresses" {
  type = list
  default =  [ "192.168.128.0/24" ]
}

variable "vnet_subnets" {
  default = {
      servers = {
        name = "snet-servers"
        addresses = [ "192.168.128.0/24" ]
      }
      vault = {
        name = "snet-vault"
        addresses = [ "192.168.129.0/24" ]
      }
  }
}

variable "vnet_nsg_rules" {
  default = {

    rdp = {
      name                       = "rdp"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "3389"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }

    sql = {
      name                       = "sql"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "SqlManagement"
      destination_address_prefix = "192.168.2.0/24"
    }

    http = {
      name                       = "http"
      priority                   = 201
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "192.168.2.0/24"
    }
  }
}