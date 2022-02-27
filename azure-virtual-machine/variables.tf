# Core Variables
variable "location" {
  description         = "Define a location for Azure resources"
  type                = string
  default             = "ukwest"
}

variable "project" {
  description         = "Project Name used in naming convention"
  type                = string
  default             = "play001"
}

variable "environment" {
  description         = "Set the environment (Prod/Dev)"
  type                = string
  default             = "test"
}


# Credential Information
variable "adminUser" {
  default             = "LocalAdministrator"
}

# Virtual Machine Variables
variable "computer_name" {
  default             = "vm-test-01"
}

variable "vm_size" {
  default             = "Standard_B4ms"
}

variable "image_publisher" {
  default             = "MicrosoftWindowsServer"
}

variable "image_offer" {
  default             = "WindowsServer"
}

variable "image_sku" {
  default             = "2019-Datacenter-smalldisk"
}

variable "image_version" {
  default             = "latest"
}

variable "delete_disk_on_termination" {
  default             = true
}

variable "data_disk_size_gb" {
  default             = 60
}

variable "data_disk_type" {
  default             = "Standard_LRS"
}