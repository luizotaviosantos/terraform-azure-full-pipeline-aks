# resource "kubectl_manifest" "cert-manager" {
#     yaml_body = file("${path.module}/cert-manager.yml")
# }

# resource "kubectl_manifest" "cluster-issuer" {
#     yaml_body = file("${path.module}/cluster-issuer.yml")
# }