variable "project" {
    description = "Workload/Application/Project Name"
    default     = "webapp"
}
variable "stage" {
    description = "Live/Dev/Staging"
    default     = "dev"
}
variable "location" {
    description = "Location for Resources"
    default     = "ukwest"
}

variable "global_vars" {
  type = map
  default = {
    locale = "ukwest"
    project = "webapp"
    stage = "dev"
  }
}