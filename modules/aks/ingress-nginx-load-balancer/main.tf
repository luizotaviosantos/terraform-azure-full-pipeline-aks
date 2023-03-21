resource "helm_release" "ingress-nginx" {
  name             = var.ingress_name
  namespace        = var.ingress_namespace
  create_namespace = true
  repository       = var.ingress_helm_repository 
  chart            = var.ingress_helm_chart 

  values = [
    templatefile("./modules/aks/ingress-nginx-load-balancer/ingress-nginx-values.yaml", { env = "${var.public_ip_aks}" }) 
  ]
} 