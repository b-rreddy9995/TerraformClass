resource "azurerm_virtual_network" "vnet" {
    name = var.vnet-name
    resource_group_name = var.resource-group
    location = var.vnet-location
    address_space = [var.address-space]
}

resource "azurerm_subnet" "subnet" {
    name = var.subnet-name
    resource_group_name = var.resource-group
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.subnet-address-prefix]
  
}
resource "azurerm_network_security_group" "nsg" {
    name = var.nsg-name
    resource_group_name = var.resource-group
    location = azurerm_virtual_network.vnet.location
    lifecycle {
      create_before_destroy = true
    }
  
}
resource "azurerm_subnet_network_security_group_association" "nsg-associate" {
    subnet_id = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
    depends_on = [
      azurerm_network_security_group.nsg
    ]
}

resource "azurerm_network_security_rule" "nsg-rules" {
    for_each = var.ns-rules
    name = "Allow-${each.value}"
    priority = each.key
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    destination_port_range = each.value
    destination_address_prefix = "*"
    source_address_prefix = "*"
    source_port_range = "*"
    network_security_group_name = azurerm_network_security_group.nsg.name
    resource_group_name = var.resource-group

    depends_on = [
      azurerm_network_security_group.nsg
    ]
  
}