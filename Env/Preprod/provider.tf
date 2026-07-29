terraform {
  # backend "azurerm" {
  #   resource_group_name  = "akhileshtestpip"
  #   storage_account_name = "akhileshstoragepipi"
  #   container_name       = "akhileshcanttest"
  #   key                  = "pipe.tfstate"
  # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "a2d0788b-89e9-49c6-8c6a-5f152ef8d304"
}