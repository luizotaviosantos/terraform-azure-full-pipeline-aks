resource "helm_release" "kubecost" {
  name             = var.kubecost_name
  namespace        = var.kubecost_namespace
  create_namespace = true
  repository       = var.kubecost_helm_repository 
  chart            = var.kubecost_helm_chart 

  values = [
    "${file("./modules/aks/kubecost/kubecost-values.yaml")}" 
  ]

} 