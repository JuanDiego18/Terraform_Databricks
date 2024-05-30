module "unity_catalog_metastore" {
  source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/unity_catalog_metastore"
  client_id=var.client_id
  client_secret=var.client_secret
  databricks_account_id=var.databricks_account_id
  tags=var.tags
  region=var.region
  prefix=var.prefix
  metastore_name=var.metastore_name
  unity_metastore_owner=var.unity_metastore_owner
}