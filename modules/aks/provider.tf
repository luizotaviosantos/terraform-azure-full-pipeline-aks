provider "azurerm" {
 features {}
}

provider "kubectl" {
    host                   = var.fqdn
    client_certificate     = base64decode(var.kubeconfig.0.client_certificate)
    client_key             = base64decode(var.kubeconfig.0.client_key)
    cluster_ca_certificate = base64decode(var.kubeconfig.0.cluster_ca_certificate)
  }
