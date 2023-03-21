resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]

  # subnet {
  #   name           = var.subnet0_name   # PUBLIC SUBNET
  #   address_prefix = var.subnet0_cidr
  # }

  # subnet { 
  #   name           = var.subnet1_name    # PRIVATE SUBNET
  #   address_prefix = var.subnet1_cidr
  # }

  # tags = {
  #   environment = "Your-Tag"
  # }
}

resource "azurerm_subnet" "sub0" {
  name         = var.subnet0_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name
  address_prefixes   = var.subnet0_cidr
}

resource "azurerm_subnet" "sub1" {
  name         = var.subnet1_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name
  address_prefixes   = var.subnet1_cidr
}