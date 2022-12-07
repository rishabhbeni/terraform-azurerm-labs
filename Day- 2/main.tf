# Using Azure as the Resource Provider
provider "azurerm" {
# The details of the Service Principal values are accessed from the variables file 
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}

# creating a random ID that will be used for resrouce group name.
resource "random_id" "id" {
  byte_length = 8
}

# Creating a local variable which uses a conditional statement.
# It assigns name to the resource group from the name defined in variables or tfvars file, 
# else if the name in variable and tfvars is blank it assigns the random ID as the name for the resource group.
locals {
  name  = (var.resource_group != "" ? var.resource_group : random_id.id.hex)
}

# Code for creating a resource group uing the local variable and location from the list in variable file
resource "azurerm_resource_group" "rg" {
  name = local.name
  location = var.locations["location1"]
}

# Code for creating Public IP address using dynamic value for environment
# It uses resource group name and location for the resource group
# It also uses lookup function and conditional statement to assign values dynamically
# It will only get created if Resource Group is created
resource "azurerm_public_ip" "ip" {
  name = lookup(var.ip_name, var.env)
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = (var.env == "prod" ? "Static" : "Dynamic")
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Code for creating Virtual Network
# It uses resource group name and location for the resource group
# It will only get created if Resource Group is created
resource "azurerm_virtual_network" "vnet" {
  name     = var.resource_group
  location = var.locations["location1"]
  resource_group_name = var.resource_group
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  depends_on = [
    azurerm_resource_group.rg
  ]
}

# Code for creating Subnets inside using dynamic value for environment
# Uses For_each loop to assign name and addresses from map in variables file
# It will only get created if Resource Group and virtual network is created
resource "azurerm_subnet" "subnet" {
    for_each = var.subnets
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    name = each.value["name"]
    address_prefixes = each.value["address_prefixes"]
    depends_on = [
      azurerm_resource_group.rg,
      azurerm_virtual_network.vnet
    ]
}

# Outputs the value of the created resource group in the terminal dynamically
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

