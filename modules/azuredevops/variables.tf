variable "project_name" {
  description = "Nome do nosso projeto Azure Devops"
}

variable "project_description" {
  description = "Descricao do nosso projeto Azure Devops"
}

variable "project_visibility" {
  description = "Visibilidade do nosso projeto Azure Devops"
}

variable "project_version_control" {
  description = "Version Control do nosso projeto Azure Devops"
}

variable "work_item_template" {
  description = "Template do nosso projeto"
}

variable "project_import_name" {
  description = "Projeto que iremos importar o grupo para criacao no novo"
}

variable "group_import_name" {
  description = "Grupo que iremos importar para criacao no novo"
}


variable "repo_ci_cd_name" {
  description = "Name of the repository"
}

variable "repo_app_name" {
  description = "Name of the repository"
}


variable "domain"{
    description = "Your domain for the creation of Ingress for Kubecost."
}
