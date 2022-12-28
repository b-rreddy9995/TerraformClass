variable "resource-group" {
    type = string
     
}

variable "vnet-name" {
    type = string
    default = "vnet-tf-module"
  
}

variable "vnet-location" {
    type = string
    default = "westeurope"
  
}
variable "address-space" {
    type = string
    default = "198.162.0.0/16"
  
}
variable "subnet-name" {
    type = string
    default = "snet-tf-module-1"
}
variable "subnet-address-prefix" {
  type = string
  default = "198.162.0.0/24"
}

variable "nsg-name" {
    type = string
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