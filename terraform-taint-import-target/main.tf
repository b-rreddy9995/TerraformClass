terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription
  client_id       = var.appId
  client_secret   = var.client_secret
  tenant_id       = var.tenantId
}

resource "azurerm_resource_group" "rgroup" {
  name     = "rg-tf-demo"
  location = "centralindia"
  tags     = {
          "department" = "HR,IT"
          "owner"      = "Ramana"
        }
}

resource "azurerm_resource_group" "rgroup1" {
    depends_on = [
      azurerm_resource_group.rgroup
    ]
  name     = "rg-tf-demo1"
  location = "centralindia"
  tags     = {
          "department" = "HR,IT"
          "owner"      = "Ramana"
        }
}

resource "azurerm_virtual_network" "vnet" {
    resource_group_name = "rg-tf-state"
    location = "West Europe"
    address_space = ["10.0.0.0/16"]
    name = "vnet-target-demo"  
}

resource "azurerm_resource_group" "rg-import" {
    name = "rg-import-demo"
    location = "westus"
  
}
