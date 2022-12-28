resource "azurerm_linux_virtual_machine" "vm-name" {
    name = var.vm-name
    resource_group_name = var.resource-group
    location = var.location
    admin_password = var.admin-password
    admin_username = var.admin-user
    size = var.vm-size
    custom_data = var.script-path
    disable_password_authentication = false
    network_interface_ids = [ var.nic-id ]

     os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
    

}