terraform {
  backend "azurerm" {
    resource_group_name  = "akhileshtestpip"
    storage_account_name = "akhileshstoragepipi2"
    container_name       = "akhileshcanttest"
    key                  = "pipe.tfstate"
    subscription_id      = "974dc80c-fc30-43c1-96a6-106db3c5d9c9"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "974dc80c-fc30-43c1-96a6-106db3c5d9c9"
}