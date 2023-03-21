variable "azure_project_id" {
  description = "Id do nosso projeto gerado pelo terraform no Azure Devops"
}

variable "aks_service_endpoint_name" {
  description = "Nome para a criação da service connection do AKS"
}

variable "acr_service_endpoint_name" {
  description = "Nome para a criação da service connection do AKS"
}

variable "cluster_context" {
  description = "Contexto da kubeconfig do nosso cluster kubernetes"
}

variable "aks_apiserver" {
  description = "Api Endpoint do nosso cluster kubernetes"
}

variable "kubeconfig_raw"{
    description = "Kubeconfig Raw do nosso cluster"
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type    = string
}


variable "depends_aks"{
    description = "Kubeconfig Raw do nosso cluster"
}