terraform {
  required_providers {
    azure = {
        source      = "hashicorp/azurerm"
        version     = "2.96.0"
    }

    azurecaf = {
        source      = "aztfmod/azurecaf"
        version     = "2.0.0-preview-1"
    }
  }
}

provider "azure" {
  features {}
}

provider "azurecaf" {
    features {}
}
