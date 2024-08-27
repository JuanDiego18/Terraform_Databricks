variable "databricks_account_id" {
    type = string
    description = "databricks account console id"
}

variable "aws_profile" {
  type        = string
  description = "(Required) AWS cli profile to be used for authentication with AWS"
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