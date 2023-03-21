# MODULE FOR RESOURCE GROUP

module "resource_group" {
  source = "./modules/resourcegroup"
 
  name = var.resource_group_name
  location = var.resource_group_location
}


# MODULE FOR VIRTUAL NETWORK

module "virtual_network" {
  source   =  "./modules/vnet"
  location   =   var.resource_group_location
  name   =  var.vnet_name
  address_space   = var.address_space
  resource_group_name   =   module.resource_group.resource_group_name
  subnet0_name = var.subnet0_name  
  subnet1_name = var.subnet1_name
  subnet0_cidr = var.subnet0_cidr
  subnet1_cidr = var.subnet1_cidr
}

# MODULE FOR CREATE ACR

module "acr_registry" {

  source = "./modules/acr"
  
  acr_name = "luizotavioacr"
  acr_sku_tier = "Standard"
  resource_group_name   =   module.resource_group.resource_group_name
  resource_group_location   =   module.resource_group.resource_group_location
  
}

# MODULE FOR AKS CLUSTER

module "aks" {
  source = "./modules/aks"


  
  # AKS CLUSTER VARIABLES

  resource_group_name   =   module.resource_group.resource_group_name
  resource_group_location   =   module.resource_group.resource_group_location
  name  =   var.aks_name
  sku_tier = var.aks_sku_tier
  dns_prefix  = var.aks_name

  # SYSTEM NODE VARIABLES

  system_node_name = var.system_node_name
  system_node_vm_size = var.system_node_vm_size
  subnet1_id  = module.virtual_network.subnet1_id

  # APPLICATION NODE VARIABLES
  apps_node_name = var.apps_node_name
  apps_node_vm_size = var.apps_node_vm_size

  # PUBLIC IP AND SHAPE FOR AKS CLUSTER
  aks_ip = "ip-aks-tf"
  ip_sku_tier = "Standard"

  acr_registry_id = module.acr_registry.acr_id

  kubeconfig = module.aks.kubeconfig
  fqdn = module.aks.aks_apiserver
  domain = module.dns.domain  

}


#  MODULE FOR INGRESS NGINX 

module "nginx_ingress" {
  source = "./modules/aks/ingress-nginx-load-balancer"
 
  ingress_name = "ingress-nginx"
  ingress_namespace = "ingress-nginx"
  ingress_helm_repository = "https://kubernetes.github.io/ingress-nginx"
  ingress_helm_chart = "ingress-nginx"

  public_ip_aks = module.aks.public_ip_aks
  kubeconfig = module.aks.kubeconfig
  fqdn = module.aks.aks_apiserver

}

# MODULE FOR KUBECOST INSTALATION 

module "kubecost" {
  source = "./modules/aks/kubecost"
 
  kubecost_name = "kubecost"
  kubecost_namespace = "kubecost"
  kubecost_helm_repository = "https://kubecost.github.io/cost-analyzer/"
  kubecost_helm_chart = "cost-analyzer"

# public_ip_aks = module.aks.public_ip_aks
  kubeconfig = module.aks.kubeconfig
  fqdn = module.aks.aks_apiserver
  domain = module.dns.domain

}


#  MODULE FOR DNS CREATION ON AZURE DNS ZONE

module "dns" {
  source = "./modules/dns"
 
  dns_zone = var.dns_zone
  resource_group_name   =   module.resource_group.resource_group_name
  public_ip_aks = module.aks.public_ip_aks
  depends_aks = module.aks.cluster_tf_id

}


#  MODULE FOR AZURE DEVOPS

module "azuredevops" {
  source = "./modules/azuredevops"
 
  project_name = "Terrafom_Project"
  project_description = "Projeto gerado via codigo terraform"
  project_visibility = "private"
  project_version_control = "Git"
  work_item_template = "Agile"
  project_import_name = "Terraform"
  group_import_name = "Project Administrators"
  repo_ci_cd_name  = "CI-CD"
  repo_app_name = "WebApp_Project" 
  domain = module.dns.domain
}



# MODULE FOR SERVICE CONNECTION

module "serviceconnections" {
  source = "./modules/serviceconnections"
 
  aks_service_endpoint_name = "aks_tf_conn"
  acr_service_endpoint_name = "luizotavioacr"
  cluster_context = "aks-tf"

  azure_project_id = module.azuredevops.azure_project_id
  aks_apiserver = module.aks.aks_apiserver
  kubeconfig_raw = module.aks.kubeconfig_raw
  resource_group_name   =   module.resource_group.resource_group_name
  depends_aks = module.aks.cluster_tf_id

}

# MODULE FOR CREATION OF PIPELINE

module "azurepipelines" {
  source = "./modules/azurepipelines"
 
  build_definition_name = "WebApp_Pipeline"
  repo_branch = "master"
 
  admin_group_imported_id = module.azuredevops.admin_group_imported_id
  repo_id = module.azuredevops.repo_id
  azure_project_id = module.azuredevops.azure_project_id
  depends_repo = module.azuredevops.repo_id
}
