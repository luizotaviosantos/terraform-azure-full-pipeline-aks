resource "azuredevops_project" "terraform_project" {
  name       = var.project_name
  description        = var.project_description
  visibility         = var.project_visibility
  version_control    = var.project_version_control
  work_item_template = var.work_item_template

  features = {
      "boards" = "enabled"
      "repositories" = "enabled"
      "pipelines" = "enabled"
      "testplans" = "enabled"
      "artifacts" = "enabled"
  }
}

data "azuredevops_group" "admin-tf-group" {
  project_id = azuredevops_project.terraform_project.id
  name = var.group_import_name 
}





resource "azuredevops_git_repository" "cicd_repository" {
  project_id = azuredevops_project.terraform_project.id
  name       = var.repo_ci_cd_name
  initialization {
    init_type = "Clean"
  }
}


resource "azuredevops_git_repository_file" "azure_pipeline" {
  repository_id       = azuredevops_git_repository.cicd_repository.id
  file                = "azure-pipelines.yml"
  content             = file("./modules/azuredevops/repos/ci-cd/azure-pipelines.yml")
  branch              = "refs/heads/master"
  commit_message      = "Add azure-pipelines.yml"
  overwrite_on_create = false
}



resource "azuredevops_git_repository_file" "yaml_generator" {
  repository_id       = azuredevops_git_repository.cicd_repository.id
  file                = "yaml_generator.py"
  content             = file("./modules/azuredevops/repos/ci-cd/yaml_generator.py")
  branch              = "refs/heads/master"
  commit_message      = "Add yaml_generator.py"
  overwrite_on_create = false
}

resource "azuredevops_git_repository_file" "k8s_manifest" {
  repository_id       = azuredevops_git_repository.cicd_repository.id
  file                = "main.yml"
  content             = file("./modules/azuredevops/repos/ci-cd/master.yml")
  branch              = "refs/heads/master"
  commit_message      = "Add main.yml"
  overwrite_on_create = false
}





resource "azuredevops_git_repository" "app_repository" {
  project_id = azuredevops_project.terraform_project.id
  name       = var.repo_app_name
  initialization {
    init_type = "Clean"
  }
}


resource "azuredevops_git_repository_file" "azure_pipeline_app" {
  repository_id       = azuredevops_git_repository.app_repository.id
  file                = "azure-pipelines.yml"
  content             = file("./modules/azuredevops/repos/app/azure-pipelines.yml")
  branch              = "refs/heads/master"
  commit_message      = "Add azure-pipelines.yml"
  overwrite_on_create = false
}

resource "azuredevops_git_repository_file" "Dockerfile" {
  repository_id       = azuredevops_git_repository.app_repository.id
  file                = "Dockerfile"
  content             = file("./modules/azuredevops/repos/app/Dockerfile")
  branch              = "refs/heads/master"
  commit_message      = "Add Dockerfile"
  overwrite_on_create = false
}