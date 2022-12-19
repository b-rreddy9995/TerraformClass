terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform{
    backend "azurerm" {
        resource_group_name = "rg-tf-state"
        storage_account_name = "strtfsubba1512"
        container_name = "tfstate"
        key = "terraform.tfstate"

 }
}

locals {
  tags={

  application = "Demo-App"
  owner = "ramana"
  }

}

resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location
  tags = local.tags
  
}

resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = var.vnet_address_space
  tags = local.tags
 
}