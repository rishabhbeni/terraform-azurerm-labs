# Module for creating Virtual Network depending upon Resource Group creation
# Values are passed from main.tf file
resource "azurerm_virtual_network" "vnet" {
  name     = var.VNet_name
  location = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_space
  dns_servers = [var.dns_servers[0], var.dns_servers[1]]
}