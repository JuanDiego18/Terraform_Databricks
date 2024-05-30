#This data source creates a policy for the root workspace bucket, so that Databricks can access it 

data "databricks_aws_bucket_policy" "this" {
  bucket = aws_s3_bucket.root_storage_bucket.bucket
}