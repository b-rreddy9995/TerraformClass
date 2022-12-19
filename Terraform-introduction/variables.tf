variable "rg_name" {
    type = string
    description = "used for resource group name"
    default = "rg"
    validation {
      condition = length(var.rg_name) > 5
      error_message = "Enter minimum 5 characters"
    }
  
}

variable "location" {
    type = string
    description = "used for resource group location"
}

variable "vnet_name" {
  type = string

}

variable "vnet_address_space" {
    type = list(any)
    default = ["10.0.0.0/16"] 
}
