terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = "1.47.0"
    }
  }
}

provider "databricks" {
  profile = var.databricks_cli_profile
}