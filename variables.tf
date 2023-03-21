#  VARIABLES FOR RESOURCE GROUP MODULE

variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
  default = "terraform-rg"
}

variable "resource_group_location" {
  description = "Region of Resource Group"
  type    = string
  default = "brazilsouth"
}


#  VARIABLES FOR THE VIRTUAL NET MODULE



variable "vnet_name" {
  description = "Name of Virtual Network"
  type    = string
  default = "VNET-DO-LUIZINHO"
}

variable "subnet0_name" {
  description = "Name of Subnet 0"
  type    = string
  default = "SUB0-010-200-000-000"
}

variable "subnet1_name" {
  description = "Name of Subnet 1"
  type    = string
  default = "SUB1-010-200-128-000"
}

variable "address_space" {
  description = "CIDR of Virtual Network"
  type    = list
  default = ["10.200.0.0/16"]
} 

variable "subnet0_cidr" {
  description = "CIDR of Subnet 0 Private"
  type    = list
  default = ["10.200.0.0/17"]
}

variable "subnet1_cidr" {
  description = "CIDR of Subnet 1 Public"
  type    = list
  default = ["10.200.128.0/17"]
}



# VARIABLES FOR AKS MODULE


variable "aks_name" {
  description = "Name of AKS Cluster"
  type    = string
  default = "aks-tf"
}

variable "aks_sku_tier" {
  description = "SKU Tier for AKS Cluster"
  type    = string
  default = "Free"
}


variable "aks_dns_prefix" {
  description = "DNS Prefix for AKS Cluster"
  type    = string
  default = "aks-tf"
}


variable "system_node_name" {
  description = "Name of System Node Pool of AKS Cluster"
  type    = string
  default = "system"
}

variable "system_node_vm_size" {
  description = "Shape of System Node Pool of AKS Cluster"
  type    = string
  default = "Standard_B2s"  
}

variable "apps_node_name" {
  description = "Name of Application Node Pool of AKS Cluster"
  type    = string
  default = "apps"
}

variable "apps_node_vm_size" {
  description = "Shape of System Node Pool of AKS Cluster"
  type    = string
  default = "Standard_B2s"  
}

# VARIABLES FOR DNS ZONE

variable "dns_zone" {
  description = "Name of DNS Zone"
  type    = string
  default = "luizotavio.cloud"
}





