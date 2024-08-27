module "workspace_creation" {
    source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/AWS/account/workspace_creation"
    client_id=var.client_id
    client_secret=var.client_secret
    databricks_account_id=var.databricks_account_id
    cross_account_role_arn=var.cross_account_role_arn
    bucket_name=var.bucket_name
    security_group_ids=var.security_group_ids
    subnet_ids=var.subnet_ids
    vpc_id=var.vpc_id
    tags=var.tags
    region=var.region
    prefix=var.prefix
  
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [module.workspace_creation]

  create_duration = "30s"
}

module "metastore_assigment" {
    source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/AWS/account/metastore_assignment"
    client_id=var.client_id
    client_secret=var.client_secret
    databricks_account_id=var.databricks_account_id
    workspace_id=module.workspace_creation.workspace_id
    metastore_id=var.metastore_id
    
    #depends_on = [module.workspace_creation]
}