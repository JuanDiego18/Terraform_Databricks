output "workspace_url" {
  value = module.workspace_creation.databricks_host
}

output "workspace_id" {
  value = module.workspace_creation.workspace_id
}