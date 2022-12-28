resource "azurerm_public_ip" "pubIp" {
    name = var.pubIp-name
    allocation_method = "Static"
    resource_group_name = var.resource-group
    location = var.location
      
}

resource "azurerm_network_interface" "Nic" {
    name = var.nic-name
    location = var.location
    resource_group_name = var.resource-group
    ip_configuration {
      name = azurerm_public_ip.pubIp.name
      subnet_id = var.subnet_id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.pubIp.id
    }
    depends_on = [
      azurerm_public_ip.pubIp
    ]
  
}