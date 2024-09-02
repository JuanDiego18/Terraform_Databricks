# Terraform_Databricks

This repository contains Terraform scripts for deploying Databricks environments on both AWS and Azure Cloud providers.

# Steps for deploying resources

1. Create a terraform.tfvars document. For example:

client_id = ""
client_secret = ""
databricks_account_id = ""
aws_profile = "juandiego_sandbox_profile"
cidr_block = "10.4.0.0/16"
region = "us-west-2"
prefix = "development-juandiego"
metastore_name = "juandiego-metastore"
unity_metastore_owner = "juandiego.vargasrosales@databricks.com"

Its strongly adviced to have secrets stored as environment variables. 

2. Run the "terraform init" command to initialize the terraform working directory (initializes the backend, downloads provider plugins, installs chils modules,
verifies the configuration, creates the .terraform directory and initializes state management)

3. Run terraform plan

4. Run terraform apply if the plan doesn't display any errors
