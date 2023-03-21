output "azure_project_id" {
  value = azuredevops_project.terraform_project.id
}

output "admin_group_imported_id" {
  value = data.azuredevops_group.admin-tf-group.id
}


output "repo_id" {
  value = azuredevops_git_repository.app_repository.id
}