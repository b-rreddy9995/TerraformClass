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

  client_id = "9ff92b3c-5bba-437d-8b59-aa5939edbe19"
  #"displayName": "azure-cli-2022-12-21-15-35-40",
  client_secret   = "5Jw8Q~AnxeiqcAdktKXw~W1Q0dE3r~QH90K_vdaY"
  tenant_id       = "4d44cdcf-469b-4f17-aa68-6d8372d63db7"
  subscription_id = "14a20d13-d0a0-4bf6-93db-ebc8d5dd970a"

  #   subscription_id = var.subscription
  #   client_id       = var.appId
  #   client_secret   = var.client_secret
  #   tenant_id       = var.tenantId
}