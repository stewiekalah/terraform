variable "global_vars" {}
variable "rg_name" {}
variable "st_name" {}
variable "st_id" {
    sensitive = true
}
variable "st_access" {
    sensitive = true
}