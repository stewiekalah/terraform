variable "location" {
  description = "Define a location for Azure resources"
  type = string
  default = "ukwest"
}

variable "project" {
  description = "Project Name used in naming convention"
  type = string
  default = "vm"
}

variable "environment" {
  description = "Set the environment (Prod/Dev)"
  type = string
  default = "test"
}