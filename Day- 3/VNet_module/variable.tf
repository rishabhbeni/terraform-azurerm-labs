# Definition of variables for Virtual Network
variable "VNet_name" {
 default = "TF-VNet" 
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "dns_servers" {
  type = list
  default = ["10.0.0.4", "10.0.0.5"]
}

# Definition of variables for Resource Group and Location
# Values are passed from main.tf file in root module
variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}