# Generating Documentation for Terraform Modules with Terraform-Docs

If you're working with Terraform modules, you know that documenting their components can be tedious. Fortunately, the open-source tool terraform-docs can help automate the process of generating documentation for Terraform modules. In this post, we'll explore how to use terraform-docs to document Terraform modules in an efficient and effective way.

## Installing Terraform-Docs

Installing Terraform-Docs is easy and can be done in just a few steps. First, you'll need to download the Terraform-Docs binary from the [GitHub releases page](https://github.com/segmentio/terraform-docs/releases). Once the binary is downloaded, you can move it to a directory of your choice and make it executable. Finally, you can add the directory to your system's PATH variable, so that you can access the command from anywhere. Once these steps are completed, Terraform-Docs is ready to use.

### Use VsCode devcontainer
When you have docker and the [VsCode Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed you can simply using the devcontainer provided with this demo.

## Sample Terraform Module for Azure Provider

To test Terraform-Docs, we can create a sample Terraform module for the Azure Provider. We'll create a module that defines a resource group and then document the module with Terraform-Docs.

First, let's create a file called `main.tf`. This file will contain the Terraform configuration for our module:

````
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "The resource group name"
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
  description = "The resource location"
}
````


Aditionally we will create a `variables.tf` file which will define some input parameters for our sample module

````
variable "rg_name" {
  type        = string
  description = "The resource group name"
}
````

Because every module usally have some outputs we will add 2 outputs in a `outputs.tf`  file for the resource group name and the location

````
output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "The resource group name"
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
  description = "The resource location"
}
````

Next, we can generate the documentation for our module using the `terraform-docs` command. We can run the following command to generate the documentation in markdown format:

`terraform-docs markdown . > docs/example-module-docs.md`

This command will generate a markdown file containing the documentation for our module. The documentation file will contain information about the module's inputs, outputs, and related resources. [The documentation for this sample module can be found here](module/docs/example-module-docs.md):


## Conclusion

Generating documentation for Terraform modules can be a time-consuming task, but Terraform-Docs makes it easy and efficient. With this tool, you can quickly generate documentation for your Terraform modules and easily update it when changes are made.