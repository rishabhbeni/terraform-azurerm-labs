terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}

# Details for connecting to service principal in Azure
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}

# Block for creating Resource Group in Azure
resource "azurerm_resource_group" "rg" {
 name     = var.resource_group_name
  location = var.location
}