 resource "azuredevops_serviceendpoint_kubernetes" "kubernetes_conn" {
   project_id            = var.azure_project_id
   service_endpoint_name = var.aks_service_endpoint_name 
   apiserver_url         = "https://${var.aks_apiserver}"
   authorization_type    = "Kubeconfig"

   kubeconfig {
    kube_config            = var.kubeconfig_raw
    accept_untrusted_certs = true
    cluster_context        = var.cluster_context
  }
  lifecycle {
    ignore_changes = [
      kubeconfig[0].cluster_context
    ]
  }

  depends_on = [
    var.depends_aks
  ]
}


 resource "azuredevops_serviceendpoint_azurecr" "acrtf_conn" {
  project_id            = var.azure_project_id
  service_endpoint_name = var.acr_service_endpoint_name  
  resource_group            = var.resource_group_name
  azurecr_spn_tenantid      = "5e03fb41-0c5f-4eda-89c7-b14598b2dab6"
  azurecr_name              = "luizotavioacr"
  azurecr_subscription_id   = "581df665-5fd1-466f-a25c-4986c03378eb"
  azurecr_subscription_name = "Azure subscription 1"
}



