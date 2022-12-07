# Enter the values for the details below after creating a service principal using the following tutorial:
 # https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

variable "subscription_id" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
 default = ""
}

variable "tenant_id" {
  default = ""
}

# Name of the Resource group can be entered here if not present in tfvars file
variable "resource_group" {
  default = ""
}

# locations can be selected from the values in map
variable "locations" {
  type = map
  default = {
    location1 = "eastus"
    location2 = "westus"
  }
}

# Subnet addresses and nanes can be selected from the values in lists
variable "subnets" {
  type = map(any)
  default = {
    subnet_1 = {
      name = "subnet_1"
      address_prefixes = ["10.0.1.0/24"]
    }
    subnet_2 = {
      name = "subnet_2"
      address_prefixes = ["10.0.2.0/24"]
    }
  }
}

# Variable for dynamically allocating environment values based on selected value
variable "env" {
  description = "env: dev or prod"
}

# Public IP name and allocation method can be selected from the values in maps
variable "ip_name" {
  type = map
  default = {
    dev = "dev_public"
    prod = "prod_public"
  }
}

variable "ipcon" {
  type = map
  default = {
    dev = "Dynamic"
    prod = "Static"
  }
}
