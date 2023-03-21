output "cluster_tf_id" {
  value = azurerm_kubernetes_cluster.aks-terraform.id
}

output "public_ip_aks" {
  value = azurerm_public_ip.ip-aks-terraform.ip_address
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.aks-terraform.kube_admin_config
}

output "kubeconfig_raw" {
  value = azurerm_kubernetes_cluster.aks-terraform.kube_admin_config_raw
}

output "aks_apiserver" {
  value = azurerm_kubernetes_cluster.aks-terraform.fqdn
}

output "azure_ad_group_id" {
  value = azuread_group.aks_adm.id
}
output "azure_ad_group_objectid" {
  value = azuread_group.aks_adm.object_id
}