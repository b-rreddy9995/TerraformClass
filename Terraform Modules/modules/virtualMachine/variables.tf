variable "resource-group" {
    type = string
  
}
variable "vm-name" {
    type = string
  
}

variable "location" {
    type=string
  
}
variable "admin-user" {
    type = string
    default = "buramana"
  
}
variable "admin-password" {
    type = string
    sensitive = true
    default = "Passw0rd$12345#"
  
}

variable "nic-id" {
    type = string
  
}

variable "script-path" {
    type = string
    # default = "./sripts/nginx.sh"
}
variable "vm-size" {
    type = string
    default = "Standard_B1s"
  
}