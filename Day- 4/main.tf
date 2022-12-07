# Terraform Provider block is required to import plugins for Azure
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }

# Backend block is defined inside provider to connect to the state file remotely in Azure Blob Storage created 
  backend "azurerm" {
    resource_group_name  = "tfstateRG01"
    storage_account_name = "<Storage Account Name>"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Data Source for fetching the name of the resource group
# This will be used to fetch the resource ID in output.tf file from Azure dynamically
data "azurerm_resource_group" "rg" {
  name = "tfstateRG01"
}

# Executing a null resouce with local-exec provisioner
# It executes a command which creates a text file locally in tmp folder and stores the current timestamp value in it
resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "echo ${timestamp()} >> /tmp/now.txt"
  }
}
