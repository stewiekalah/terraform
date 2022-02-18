# Common Variables
variable "location" {}
variable "rgname" {}
variable "nameconvention" {}

variable "subnet_id" {
  description = "Subnet ID Passed through from VNet Module"
}

variable "adminUser" {}

variable "adminPass" {
  sensitive = true
}

variable "vm_size" {}
variable "computer_name" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "image_version" {}
variable "delete_disk_on_termination" {}
variable "data_disk_size_gb" {}
variable "data_disk_type" {}