provider "azurerm" {
  subscription_id = "<Subcription ID>"
  client_id = "<Client ID>"
  client_secret = "<Client Secret>"
  tenant_id = "<Tenant ID>"
  features {}
}

# Calling Module for creating Resource Group and Virtual Network
# Passing values from terraform.tfvars file into the child modules dynamically
module "RG_module" {
    source = "./RG_module"  
    resource_group = var.resource_group
    location = var.location
}

module "VNet_module" {
    source = "./VNet_module"
    resource_group = var.resource_group
    location = var.location
}