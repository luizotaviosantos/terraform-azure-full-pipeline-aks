resource "azuredevops_build_definition" "pipeline_webapp_tf" {
  project_id = var.azure_project_id
  name       = var.build_definition_name       
  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = var.repo_id
    branch_name = var.repo_branch
    yml_path    = "/azure-pipelines.yml"
  }

  depends_on = [
    var.depends_repo
  ]

}

resource "azuredevops_build_definition_permissions" "pipeline-webapp-perms-tf" {
  project_id = var.azure_project_id
  principal  = var.admin_group_imported_id

  build_definition_id = azuredevops_build_definition.pipeline_webapp_tf.id

  permissions = {
    ViewBuilds       = "Allow"
    EditBuildQuality = "Allow"
    DeleteBuilds     = "Allow"
    StopBuilds       = "Allow"
    AdministerBuildPermissions = "Allow"
    OverrideBuildCheckInValidation = "Allow"
  }

  depends_on = [
    azuredevops_build_definition.pipeline_webapp_tf
  ]

}


