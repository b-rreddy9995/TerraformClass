variable "subscription" {
  type = string
}
variable "appId" {
    type = string
}

variable "client_secret" {
 type = string
 sensitive = true

}

variable "tenantId" {
    type = string
  
}