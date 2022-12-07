# Replace the values inside the provider block with the values of your app registration before you begin

Modules
--------
Create a folder named RG_module and inside it create a file with the name RG_module.tf and variables.tf.
# Then add the code for creating resource groups with name and location in variable file.
# Create similar modules for Virtual Network, Subnets and Public IP addresses.
# Call all the modules with the name of the source folder in the main file in root directory
# Create tfvars file for variable values and pass them in the module call which gets passed to child modules

Workspaces
-----------
# Run command: terraform workspace new <your workspace name> to create a new workspace
# Perform the plan and apply command in the new workspace to see the output
# After the command succeeds, switch to the default workspace and change the variable values
# Now run the plan and apply commands in the default workspace to see the new resources being deployed along with existing ones


Importing Existing Resources
-----------------------------
# Create a folder named importdir in the root directory and create a file in it like import.tf
# Write a placeholder syntax for importing the resource
resource "azurerm_resource_group" "rg" {
  
}

#Run command: terraform import azurerm_resource_group.rg 'Resource ID of your resource"

