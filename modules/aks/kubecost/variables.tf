variable "kubecost_name"{
    description = "Nome do nosso kubecost"
}

variable "kubecost_namespace"{
    description = "Namespace do nosso kubecost no cluster"
}

variable "kubecost_helm_repository"{
    description = "Repositorio do nosso kubecost no cluster"
}

variable "kubecost_helm_chart"{
    description = "Chart do nosso kubecost o cluster"
}

variable "kubeconfig"{
    description = "Kubeconfig do nosso cluster kubernetes"
}


variable "fqdn"{
    description = "Kubeconfig do nosso cluster kubernetes"
}


variable "domain"{
    description = "Your domain for the creation of Ingress for Kubecost."
}