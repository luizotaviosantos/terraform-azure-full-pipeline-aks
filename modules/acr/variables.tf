variable "acr_name" {
  description = "Nome do nosso Azure Registry"
}

variable "acr_sku_tier" {
  description = "Tier do nosso Azure Registry"
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
}

variable "resource_group_location" {
  description = "Region of Resource Group"
  type    = string
}
