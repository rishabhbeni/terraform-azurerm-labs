# Module for creating Resrouce Group
# The values are passed from main.tf file
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}