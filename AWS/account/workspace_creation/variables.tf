variable "client_id" {
    type = string
    description = "Application ID of the Service Principal"
}

variable "client_secret" {
    type = string
    description = "Secret of the Service Princiapl"
}

variable "databricks_account_id" {
    type = string
    description = "databricks account console id"
}

variable "cross_account_role_arn" {
  type        = string
  description = "Cross Account role ARN that allows DB to create resources in AWS account"
}

variable "bucket_name" {
  type        = string
  description = "name of the DB Workspace default bucket"
}

variable "security_group_ids" {
  type        = list(string)
  description = "id of the security groups used for the customer managed VPC"
}

variable "subnet_ids" {
  type        = list(string)
  description = "id of the subnets for the customer managed vpc"
}

variable "vpc_id" {
  type        = string
  description = "name of the DB Workspace default bucket"
}

variable "tags" {
    default = {}
}

variable "region" {
    type = string
    default = "us-west-2"
    description = "AWS region to deploy to"
}

variable "prefix" {
  default     = "juandiego"
  type        = string
  description = "Prefix for use in the generated names"
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = var.prefix != "" ? var.prefix : "juandiego${random_string.naming.result}"
  #metastore_name = var.metastore_name == null ? "${var.prefix}-metastore" : var.metastore_name
}