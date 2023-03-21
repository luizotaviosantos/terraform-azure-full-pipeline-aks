resource "random_pet" "aksrandom" {

}

resource "azurerm_log_analytics_workspace" "insights" {
  name                = "logs-${random_pet.aksrandom.id}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  retention_in_days   = 30
}