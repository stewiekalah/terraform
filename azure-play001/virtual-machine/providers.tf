terraform {
  required_providers {
    azure = {
      source        = "hashicorp/azurerm"
      version       = "~>2.96.0"
    }
  }
}

provider "azure" {
  features {}
}