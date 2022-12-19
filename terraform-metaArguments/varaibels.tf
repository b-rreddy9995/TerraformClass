variable "vnets" {
    type = map(any)
    default = {
      "vnet-front-end" = "172.16.0.0/16"
      "vnet-back-end" = "192.168.0.0/16" 
    }
  
}