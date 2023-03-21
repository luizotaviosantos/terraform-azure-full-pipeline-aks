resource "azurerm_kubernetes_cluster" "aks-terraform" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  node_resource_group = "${var.resource_group_name}-aks"
  sku_tier            = var.sku_tier
  dns_prefix = var.dns_prefix
# kubernetes_version  = var.aks_version    ### IF NOT SPECIFIED, THE LATEST RECOMMENDED WILL BE USED!!!!


  default_node_pool {
    name                = var.system_node_name
    vm_size             = var.system_node_vm_size
    zones               = ["2", "3"]
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 1
    os_disk_type        = "Managed"
    os_disk_size_gb     = 32
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = var.subnet1_id
  }


#  NETWORK PROFILE   dns_prefix = var.dns_prefix

  # network_profile {
  #   network_plugin     = "azure"
  #   network_policy     = "azure"
  #   dns_service_ip     = "10.0.0.10"
  #   docker_bridge_cidr = "172.18.0.1/16"
  #   service_cidr       = "10.0.0.0/16"
  #   load_balancer_sku  = "standard"
  # }





  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_adm.id]
    azure_rbac_enabled     = true
  }


  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
  }



  tags = {
    environment = "prd"
  }    
  
  identity {
    type = "SystemAssigned"
  }
}





resource "azurerm_kubernetes_cluster_node_pool" "apps" {
  name                  = var.apps_node_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-terraform.id
  vm_size               = var.apps_node_vm_size
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 2
  vnet_subnet_id      = var.subnet1_id
#  os_type = "Linux"  # IF YOU DON'T CHANGE LINUX IS THE DEFAULT

}




resource "azurerm_public_ip" "ip-aks-terraform" {

  name                = var.aks_ip
  resource_group_name = "${var.resource_group_name}-aks"
  location            = var.resource_group_location
  allocation_method   = var.allocation_method_tf
  sku                 = var.ip_sku_tier

  depends_on = [
    azurerm_kubernetes_cluster.aks-terraform
  ]  
}




resource "azurerm_role_assignment" "ra" {
  principal_id                     =  azurerm_kubernetes_cluster.aks-terraform.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_registry_id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_kubernetes_cluster.aks-terraform
  ] 
}




