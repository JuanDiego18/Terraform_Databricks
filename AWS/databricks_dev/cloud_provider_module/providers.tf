terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = "1.44.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

# provider "aws" {
#   region = var.region
#   profile = var.aws_profile
# }

# provider "databricks" {
#   alias         = "mws"
#   host          = "https://accounts.cloud.databricks.com"
#   account_id    = var.databricks_account_id
#   #client_id     = var.client_id
#   #client_secret = var.client_secret
# }