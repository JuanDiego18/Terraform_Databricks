resource "databricks_metastore" "this" {
  provider      = databricks.mws
  name          = var.metastore_name
  owner         = var.unity_metastore_owner
  region        = var.region
  force_destroy = true
}