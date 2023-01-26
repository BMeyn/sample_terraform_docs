output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "The resource group name"
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
  description = "The resource location"
}