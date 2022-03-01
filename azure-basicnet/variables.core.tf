variable "global_vars" {
  type = map
  default = {
    locale = "ukwest"
    stage = "dev"
  }
}

variable "projects" {
  type = map
  default = {
    network = "net"
  }
}