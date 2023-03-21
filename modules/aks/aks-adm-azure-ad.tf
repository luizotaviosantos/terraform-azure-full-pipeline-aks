resource "azuread_group" "aks_adm" {
  display_name        = "${var.name}-cluster-administrators"
  description = "Azure AKS Kubernetes administrators for the ${var.name}-cluster."
}
