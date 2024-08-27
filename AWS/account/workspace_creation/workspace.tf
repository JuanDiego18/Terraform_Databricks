# Credentials configuration


resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "30s"
}


resource "databricks_mws_credentials" "this" {
  provider         = databricks.mws
  #account_id     = var.databricks_account_id
  credentials_name = "${local.prefix}-creds"
  role_arn         = var.cross_account_role_arn
}


# Storage configuration


resource "databricks_mws_storage_configurations" "this" {
  provider                   = databricks.mws
  account_id                 = var.databricks_account_id
  bucket_name                = var.bucket_name
  storage_configuration_name = "${local.prefix}-storage"
}


# Network Configuration

resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = var.databricks_account_id
  network_name       = "${local.prefix}-network"
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
}

# Adding 20 second timer to avoid Failed credential validation check
# resource "time_sleep" "wait" {
#   create_duration = "20s"
#   depends_on = [
#     aws_iam_policy.policy
#   ]
# }

# Resource for workspace creation 

resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.region
  workspace_name = local.prefix
  credentials_id           = databricks_mws_credentials.this.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.this.storage_configuration_id
  network_id               = databricks_mws_networks.this.network_id

}