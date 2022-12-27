# Resource group Variables
variable "group-name" {
    type = string
    default = "rg-provision-demo"  
}

variable "location" {
    type = string
    default = "westeurope"
  
}

#Virtual Network variables
variable "vnet-name" {
    type = string
    default = "vnet-prsvn"
 
}

variable "address-space" {
    type = string
    default = "172.16.0.0/16"  
}

# subnet variables

variable "subnet-name" {
    type = string
    default = "snet-prsvn"
}

variable "address-prefixes" {
    type = string
    default = "172.16.1.0/24"
  
}

# Public Ip address variable
variable "pip-name" {
    type = string
    default = "pip-prsvn"
  
}

#Network interface variables
variable "nic-name" {
    type = string
    default = "nicprvsn"
}
variable "ip-config" {
    type = string
    default = "ipaddrcinfug"
  
}

#Virtual machine variables

variable "vm-name" {
    type = string
    default = "vm-prrvsn-01"
  
}

variable "vm-size" {
    type = string
    default = "Standard_B1s"
}

variable "admin-user" {
    type = string
    default = "buramana"
  
}

variable "admin-password" {
    type = string
    sensitive = true
    default = "Passw0rd#12345$"
}

#security Rules
variable "security-rule" {
    type = map(any)
    default = {
      "Inbound-rule" = "Inbound" ,
      "Outbound-rule" = "Outbound"
    }  
}