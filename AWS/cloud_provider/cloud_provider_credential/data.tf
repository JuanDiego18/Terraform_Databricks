#This data source creates the trust policy that allows Databricks AWS account to assume a role

data "databricks_aws_assume_role_policy" "this" {
  external_id = var.databricks_account_id
}

#This data source creates the cross acount policy that allows Databricks to create resources in the AWS compute plane

data "databricks_aws_crossaccount_policy" "this" {

}