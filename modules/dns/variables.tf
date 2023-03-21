variable "dns_zone" {
  description = "Name of Virtual Network"
  type    = string
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
}

variable "public_ip_aks"{
    description = "Ip publico importado do modulo do nosso Aks"
}

variable "depends_aks"{
    description = "Kubeconfig Raw do nosso cluster"
}