locals {
    naming = "${var.project}-${substr(var.location,0,3)}-${var.environment}"
}