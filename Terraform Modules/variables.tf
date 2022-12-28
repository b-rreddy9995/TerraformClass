#<-------------resource Group Variable----->#
variable "resource-group" {
  type    = string
  default = "rg-module-demo"

}
variable "rg-location" {
  type    = string
  default = "westeurope"

}
################################################
#<----------virtualNetwork Variables------>#
variable "vnet-name" {
  type    = string
  default = "vnet-tf-module"

}

variable "vnet-location" {
  type    = string
  default = "westeurope"

}
variable "address-space" {
  type    = string
  default = "198.162.0.0/16"

}
variable "subnet-name" {
  type    = string
  default = "snet-tf-module-1"
}
variable "subnet-address-prefix" {
  type    = string
  default = "198.162.0.0/24"
}

variable "nsg-name" {
  type    = string
  default = "nsg-tf-module"

}

variable "ns-rules" {
  type = map(any)
  default = {
    "100" = 22
    "101" = 8080
    "102" = 80
    "103" = 443
    "104" = 8024
  }

}
######################################################
#<-----------Nic-publicIP variables-------->#
variable "pubIp-name" {
  type    = string
  default = "pip-tf-module"

}
variable "nic-name" {
  type    = string
  default = "nic-tf-module"
}
#<-------------------Virtual Machine module variables>
variable "admin-user" {
  type    = string
  default = "buramana"

}
variable "admin-password" {
  type      = string
  sensitive = true
  default   = "Passw0rd$12345#"

}


variable "vm-size" {
  type    = string
  default = "Standard_B1s"

}
variable "vm-name" {
  type    = string
  default = "vm-tf-module"

}
#<-----------provider variables---------->#
variable "subscription" {
  type    = string
  default = "14a20d13-d0a0-4bf6-93db-ebc8d5dd970a"

}
variable "appId" {
  type        = string
  description = "Enter client id or AppID"
  default     = "9ff92b3c-5bba-437d-8b59-aa5939edbe19"

}
variable "tenantId" {
  type    = string
  default = "4d44cdcf-469b-4f17-aa68-6d8372d63db7"

}
variable "client_secret" {
  type      = string
  sensitive = true
  default   = "5Jw8Q~AnxeiqcAdktKXw~W1Q0dE3r~QH90K_vdaY"

}
#############################################################