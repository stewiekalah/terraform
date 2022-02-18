variable "location" {
  description = "Define a location for Azure resources"
  type = string
  default = "UK West"
}

variable "project" {
  description = "Project Name used in naming convention"
  type = string
  default = "vm"
}