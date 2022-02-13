variable "location" {
  description = "Location grouping for project"
  type = string
  default = "ukwest"
}

variable "project" {
  description = "Project Name used in convention"
  type = string
  default = "terraform"
}

variable "stage" {
  description = "Project Name used in convention"
  type = string
  default = "dev"
}