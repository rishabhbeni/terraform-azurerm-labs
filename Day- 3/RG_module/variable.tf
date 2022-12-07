# Definition of variables for Resource Group and Location
# Values are passed from main.tf file in root module
variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}