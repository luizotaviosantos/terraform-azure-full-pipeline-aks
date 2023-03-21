resource "kubectl_manifest" "kubecost_certificate" {
    yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
 name: kubecost-tls
 namespace: kubecost
spec:
 dnsNames:
   - kubecost.${var.domain}
 secretName: kubecost-tls
 issuerRef:
   name: letsencrypt-cluster-issuer
   kind: ClusterIssuer
YAML
}


resource "kubectl_manifest" "kubecost_ingress" {
    yaml_body = <<YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: "nginx"
  name: kubecost
  namespace: kubecost
spec:
  tls:
  - hosts:
    - kubecost.${var.domain}
    secretName: kubecost-tls
  rules:
  - host: kubecost.${var.domain}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kubecost-cost-analyzer
            port:
              number: 9090
YAML

  depends_on = [
    helm_release.kubecost
  ] 

}



resource "kubectl_manifest" "kubecost_grafana_certificate" {
    yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
 name: kubecost-grafana-tls
 namespace: kubecost
spec:
 dnsNames:
   - grafana.${var.domain}
 secretName: kubecost-grafana-tls
 issuerRef:
   name: letsencrypt-cluster-issuer
   kind: ClusterIssuer
YAML
}


resource "kubectl_manifest" "kubecost_grafana_ingress" {
    yaml_body = <<YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: "nginx"
  name: kubecost-grafana
  namespace: kubecost
spec:
  tls:
  - hosts:
    - grafana.${var.domain}
    secretName: kubecost-grafana-tls
  rules:
  - host: grafana.${var.domain}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kubecost-grafana
            port:
              number: 80
YAML

  depends_on = [
    helm_release.kubecost
  ] 
}


