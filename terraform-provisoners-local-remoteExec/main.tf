## This configuration file is to demonistrate the provisioners.
# Terraform provisioners are used to excute actions on remote hosts.we have two types of Provisioners 
# 1. Generic  -- file,local-exec,remote-exec 
# 2. Vendor provisioners -- Ansible, chef, puppet etc. 
# In this demonistrated about the generic provisioners.
#<<-------------------------------------------------------------------------->>#

# Create Resource group
resource "azurerm_resource_group" "rg-prsvn" {
  name     = var.group-name
  location = var.location

}

# Create virtual network
resource "azurerm_virtual_network" "vnet-prsvn" {
  name                = var.vnet-name
  resource_group_name = azurerm_resource_group.rg-prsvn.name
  location            = azurerm_resource_group.rg-prsvn.location
  address_space       = [var.address-space]
}

#Create subnetwork
resource "azurerm_subnet" "snet-prsvn" {
  name                 = var.subnet-name
  virtual_network_name = azurerm_virtual_network.vnet-prsvn.name
  resource_group_name  = azurerm_resource_group.rg-prsvn.name
  address_prefixes     = [var.address-prefixes]
}

#Create Public Ipaddress for Virtual Machine
resource "azurerm_public_ip" "pip-prsvn" {
  name                = var.pip-name
  resource_group_name = azurerm_resource_group.rg-prsvn.name
  location            = azurerm_resource_group.rg-prsvn.location
  allocation_method   = "Dynamic"

}
#Update known_host file in local
resource "null_resource" "localexec" {
}
#Create network interface
resource "azurerm_network_interface" "nic-prvsn" {
  name                = var.nic-name
  resource_group_name = azurerm_resource_group.rg-prsvn.name
  location            = azurerm_resource_group.rg-prsvn.location
  ip_configuration {
    name                          = var.ip-config
    subnet_id                     = azurerm_subnet.snet-prsvn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-prsvn.id
  }
}

#Create Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.rg-prsvn.location
  resource_group_name = azurerm_resource_group.rg-prsvn.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
#Associate nsg with NIC
resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.nic-prvsn.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#<------------Create linux Virtual machine and provisioners------------------>
resource "azurerm_linux_virtual_machine" "vm-prvsn" {
  name                = var.vm-name
  resource_group_name = azurerm_resource_group.rg-prsvn.name
  location            = azurerm_resource_group.rg-prsvn.location
  size                = var.vm-size    #"Standard_B1s"
  admin_username      = var.admin-user #"adminuser"
  # admin_password      = var.admin-password
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic-prvsn.id
  ]

  admin_ssh_key {
    username   = var.admin-user
    public_key = file("~/.ssh/id_rsa.pub")
  }

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
#<---------------------Linux VM block completed------------------------>

#<---------------- Creating windows virtual machine and provisioners------------------->
# resource "azurerm_windows_virtual_machine" "vm-win" {
#   name                = "win-vm-tf"
#   resource_group_name = azurerm_resource_group.rg-prsvn.name
#   location            = azurerm_resource_group.rg-prsvn.location
#   size                = "Standard_F2"
#   admin_username      = var.admin-user
#   admin_password      = var.admin-password
#   network_interface_ids = [
#     azurerm_network_interface.nic-prvsn.id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
#   provisioner "file" {
#     source = "./nginxinstall.ps1"
#     destination = "C:/nginxinstall.ps1"
#      connection {
#       host = self.public_ip_address
#       type = "winrm"
#       user = var.admin-user
#       password = var.admin-password
#     }
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "./Install-Nginx.ps1 -Version 1.11.10 -InstallPath C:/Nginx"
#     ]
#     connection {
#       host = self.public_ip_address
#       type = "winrm"
#       user = var.admin-user
#       password = var.admin-password
#     }

#   }
# }
#<----------------------------wndows VM block completed-------------->#

## Resources to for provisioners
resource "null_resource" "provisioners-demo" {
  provisioner "file" {
    source      = "./nginxinstall.sh"
    destination = "/home/${var.admin-user}/nginxinstall.sh"
    connection {
      host        = azurerm_public_ip.pip-prsvn.ip_address
      type        = "ssh"
      user        = var.admin-user
      private_key = file("~/.ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sh nginxinstall.sh",
    ]
    connection {
      host        = azurerm_public_ip.pip-prsvn.ip_address
      type        = "ssh"
      user        = var.admin-user
      private_key = file("~/.ssh/id_rsa")

    }
  }

}

## Outputs Section start here.

output "public_ip" {
  value = azurerm_public_ip.pip-prsvn.ip_address
}

# output "vm-resource" {
#     value = azurerm_windows_virtual_machine.vm-win.id
# }
output "vnet-resourceId" {
  value = azurerm_virtual_network.vnet-prsvn.id

}

output "nic-id" {
  value = azurerm_network_interface.nic-prvsn.id

}

output "snet-id" {
  value = azurerm_subnet.snet-prsvn.id

}
