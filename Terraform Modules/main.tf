resource "azurerm_resource_group" "rg" {
  name     = var.resource-group
  location = var.rg-location

}

module "virtualNetwork" {
  source                = "./modules/virtualNetwork"
  vnet-name             = var.vnet-name
  resource-group        = azurerm_resource_group.rg.name
  vnet-location         = azurerm_resource_group.rg.location
  address-space         = var.address-space
  subnet-name           = var.subnet-name
  subnet-address-prefix = var.subnet-address-prefix
  nsg-name              = var.nsg-name
  ns-rules              = var.ns-rules
}

module "Nic-publicIP" {
  source = "./modules/Nic-publicIP"
  depends_on = [
    module.virtualNetwork
  ]
  resource-group = var.resource-group
  location       = var.rg-location
  pubIp-name     = var.pubIp-name
  nic-name       = var.nic-name
  subnet_id      = module.virtualNetwork.subnet_id
}

module "VirtualMachine" {
  source         = "./modules/virtualMachine"
  vm-name        = var.vm-name
  admin-password = var.admin-password
  admin-user     = var.admin-user
  location       = azurerm_resource_group.rg.location
  resource-group = azurerm_resource_group.rg.name
  nic-id         = module.Nic-publicIP.out-nic-id
  script-path    = filebase64("./scripts/nginx.sh")
  vm-size        = var.vm-size
}
