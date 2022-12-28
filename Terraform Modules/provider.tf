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