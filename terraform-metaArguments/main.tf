#To create multiple Vnets in single Resourcegroup and different address space.

#creating single Resource group
resource "azurerm_resource_group" "rg-meta" {
    name = "rg-meta-Demo"
    location = "centralindia"
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
#To create 2 vnets using count meta-argument 
resource "azurerm_virtual_network" "vnets" {
    count = 2
    name = "vnet-${count.index+1}"
    resource_group_name = azurerm_resource_group.rg-meta.name
    location = azurerm_resource_group.rg-meta.location
    address_space = ["10.${count.index}.0.0/16"]
  
}
#To create 2 vnets with different names and address spaces using for_each
resource "azurerm_virtual_network" "vnets2" {
 for_each = var.vnets
 resource_group_name = azurerm_resource_group.rg-meta.name
 location = azurerm_resource_group.rg-meta.location
 name = each.key
 address_space = [each.value]
}

#To define the dependency or order of resources creation we will use "depends_on" meta argument.
#below is the smaple code to create rg-tf-demo1 resource group after creation of "rg-meta-Demo" resource group. 
resource "azurerm_resource_group" "rg-meta" {
    depends_on = [
      azurerm_resource_group.rg-meta
    ]
  name     = "rg-tf-demo1"
  location = "centralindia"
  tags     = {
          "department" = "HR,IT"
          "owner"      = "Ramana"
        }
}
