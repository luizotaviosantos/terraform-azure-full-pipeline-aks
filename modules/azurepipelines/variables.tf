variable "azure_project_id" {
  description = "Id do projeto do azure gerado pelo terraform"
}

variable "build_definition_name" {
  description = "Nome da pipeline que iremos criar"
}

variable "repo_id" {
  description = "Id do repositorio no qual estamos clonando de outro projeto"
}

variable "repo_branch" {
  description = "Branch do repositorio no qual faremos o fork"
}

variable "admin_group_imported_id" {
  description = "Grupo no qual daremos as permissões necessárias"
}



variable "depends_repo" {
   description = "Dependencie for Pipeline"
}