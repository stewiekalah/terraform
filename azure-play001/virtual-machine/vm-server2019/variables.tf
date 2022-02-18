variable "location" {
  description = "Define a location for Azure resources"
}

variable "project" {
  description = "Project Name used in naming convention"
}

variable "environment" {
  description = "Set the environment (Prod/Dev)"
}

variable "rgname" {
  description = "resource_group_name"
}

variable "nameconvention" {
  description = "Resource Type - Project - Location - Environment"
}

variable "subnet_id" {
  description = "Subnet ID Passed through from VNet Module"
}

variable "adminUser" {
}

variable "adminPass" {
  sensitive = true
}