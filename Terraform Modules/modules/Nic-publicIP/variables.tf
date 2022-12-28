variable "pubIp-name" {
    type = string
    default = "pip-tf-module"
  
}
variable "resource-group" {
    type = string
      
}

variable "location" {
    type = string
  
}

variable "nic-name" {
  type = string
  default = "nic-tf-module"
}

variable "subnet_id" {
    type = string
  
}