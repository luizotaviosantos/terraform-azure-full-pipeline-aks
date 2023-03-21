variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
}

variable "resource_group_location" {
  description = "Region of Resource Group"
  type    = string
}

variable "name" {
  description = "Name of AKS Cluster"
  type    = string
}


variable "sku_tier" {
  description = "Name of AKS Cluster"
  type    = string
}

variable "dns_prefix" {
  description = "DNS Prefix for AKS Cluster"
  type    = string
}

variable "system_node_name" {
  description = "Name of System Node Pool of AKS Cluster"
  type    = string
}

variable "system_node_vm_size" {
  description = "Shape of System Node Pool of AKS Cluster"
  type    = string
}

variable "subnet1_id" {
  description = "Shape of System Node Pool of AKS Cluster"
  type    = string
}

variable "apps_node_name" {
  description = "Name of Application Node Pool of AKS Cluster"
  type    = string
}

variable "apps_node_vm_size" {
  description = "Shape of System Node Pool of AKS Cluster"
  type    = string 
}


variable "allocation_method_tf"{
    description = "Allocation Method"
    default = "Static"
}


variable "aks_ip" {
  description = "Ip publico do Aks"
  type    = string
}

variable "ip_sku_tier" {
  description = "Tier do SKU do Ip Publico"
  type    = string
}

variable "acr_registry_id" {
  description = "ACR ID"
}
  

variable "kubeconfig"{
    description = "Kubeconfig do nosso cluster kubernetes"
}


variable "fqdn"{
    description = "Kubeconfig do nosso cluster kubernetes"
}


variable "domain"{
    description = "Your domain for the creation of Ingress for Kubecost."
}  