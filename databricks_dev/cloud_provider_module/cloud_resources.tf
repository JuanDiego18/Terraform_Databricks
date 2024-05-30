module "cloud_provider_credential" {
    source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/cloud_provider/cloud_provider_credential"
    databricks_account_id=var.databricks_account_id
    aws_profile=var.aws_profile
    region=var.region
    prefix=var.prefix
}

module "cloud_provider_storage" {
    source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/cloud_provider/cloud_provider_storage"
    databricks_account_id=var.databricks_account_id
    aws_profile=var.aws_profile
    region=var.region
    prefix=var.prefix
}

module "cloud_provider_network" {
    source = "/Users/juandiego.vargasrosales/Desktop/Terraform-Databricks-Deploy/Terraform_Databricks/cloud_provider/cloud_provider_network"
    databricks_account_id=var.databricks_account_id
    aws_profile=var.aws_profile
    region=var.region
    cidr_block=var.cidr_block
    prefix=var.prefix
}