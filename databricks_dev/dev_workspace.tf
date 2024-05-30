module "cloud_provider_module" {
  source = "./cloud_provider_module"
  databricks_account_id=var.databricks_account_id
  aws_profile=var.aws_profile
  region=var.region
  prefix=var.prefix
  cidr_block=var.cidr_block
}

module "metastore_module" {
  source = "./metastore_module"
  client_id=var.client_id
  client_secret=var.client_secret
  databricks_account_id=var.databricks_account_id
  tags=var.tags
  region=var.region
  prefix=var.prefix
  metastore_name=var.metastore_name
  unity_metastore_owner=var.unity_metastore_owner
}

module "account_module" {
    source = "./account_module"
    client_id=var.client_id
    client_secret=var.client_secret
    databricks_account_id=var.databricks_account_id
    cross_account_role_arn=module.cloud_provider_module.cloud_provider_credential
    bucket_name=module.cloud_provider_module.cloud_provider_storage
    security_group_ids=module.cloud_provider_module.cloud_provider_network_security_groups
    subnet_ids=module.cloud_provider_module.cloud_provider_network_subnets
    vpc_id=module.cloud_provider_module.cloud_provider_network_vpc
    tags=var.tags
    region=var.region
    prefix=var.prefix
    metastore_id=module.metastore_module.metastore_id

    #depends_on = [module.cloud_provider_module, module.metastore_module]
}