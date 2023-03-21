resource "azurerm_container_registry" "acr-tf" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  sku                      = var.acr_sku_tier
  admin_enabled            = false
}
