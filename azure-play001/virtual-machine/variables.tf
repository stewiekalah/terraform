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

variable "adminUser" {
  default             = "LocalAdministrator"
}

variable "kv_name" {
  default             = "kv-ansellpw-live"
}

variable "kv_rg" {
  default             = "ansell.pw"
}

variable "kv_secret-AdminPassword" {
  default             = "Terraform-VMDeploy-AdminPassword"
  sensitive           = true
}